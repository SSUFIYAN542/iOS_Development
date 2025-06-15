//
//  ViewController.m
//  geoFenceSample1
//
//  Created by syed on 14/06/25.
//

#import "ViewController.h"
#import <UserNotifications/UserNotifications.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self requestNotificationPermission];
    [self setupLocationManager];
}

- (void)setupLocationManager {
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    // Request Always Authorization
    if ([self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
        [self.locationManager requestAlwaysAuthorization];
    }
    
    if ([CLLocationManager isMonitoringAvailableForClass:[CLCircularRegion class]]) {
        [self setupGeofenceRegion];
    }
    
    NSLog(@"Setup complete");
}

- (void)setupGeofenceRegion {
    //adding cooridinates, radius, identifier..
    CLLocationCoordinate2D center = CLLocationCoordinate2DMake(37.3349, -122.0090);
    CLLocationDistance radius = 100; // meters
    NSString *identifier = @"AppleParkRegion";
    
    CLCircularRegion *region = [[CLCircularRegion alloc] initWithCenter:center
                                                                 radius:radius
                                                             identifier:identifier];
    region.notifyOnEntry = YES;
    region.notifyOnExit = YES;
    //Start monitoring..
    [self.locationManager startMonitoringForRegion:region];
    
    //see the currect state of user..
    [self.locationManager requestStateForRegion:region];
    
    NSLog(@"Monitored regions: %@", self.locationManager.monitoredRegions);

}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region {
    NSLog(@"You entered the region!");
    [self sendLocalNotificationWithTitle:@"Geofence" message:@"You entered the region!"];
    [self showAlertWithTitle:@"Geofence" message:@"You entered the region!"];
}


- (void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region {
    NSLog(@"You exited the region!");
    [self sendLocalNotificationWithTitle:@"Geofence" message:@"You exited the region!"];
    [self showAlertWithTitle:@"Geofence" message:@"You exited the region!"];
}

// Helper method to send notification
- (void)sendLocalNotificationWithTitle:(NSString *)title message:(NSString *)message {
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.title = title;
    content.body = message;
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:1 repeats:NO];
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:[[NSUUID UUID] UUIDString]
                                                                          content:content
                                                                          trigger:trigger];
    [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request withCompletionHandler:nil];
}

//Failure case handler
- (void)locationManager:(CLLocationManager *)manager monitoringDidFailForRegion:(CLRegion *)region withError:(NSError *)error {
    NSLog(@"Monitoring failed for region: %@. Error: %@", region.identifier, error.localizedDescription);
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"Location manager failed: %@", error.localizedDescription);
}


//delegate method to see the currect state of user..
- (void)locationManager:(CLLocationManager *)manager didDetermineState:(CLRegionState)state forRegion:(CLRegion *)region {
    if (state == CLRegionStateInside) {
        NSLog(@"User is inside the region");
    } else if (state == CLRegionStateOutside) {
        NSLog(@"User is outside the region");
    } else {
        NSLog(@"Region state is unknown");
    }
}

//Requesting permisson for notifications
- (void)requestNotificationPermission {
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    [center requestAuthorizationWithOptions:(UNAuthorizationOptionAlert + UNAuthorizationOptionSound)
                          completionHandler:^(BOOL granted, NSError * _Nullable error) {
        if (granted) {
            NSLog(@"Notification permission granted.");
        } else {
            NSLog(@"Notification permission denied.");
        }
    }];
}

//displaying in-app alert in foreground..
- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
