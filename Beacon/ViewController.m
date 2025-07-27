//
//  ViewController.m
//  DemoIBeaconApp
//
//  Created by syed on 24/07/25.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLMonitor *monitoringManager;
@property (strong, nonatomic) NSMutableDictionary<NSString *, NSArray<CLBeacon *> *> *rangedBeacons;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.rangedBeacons = [NSMutableDictionary new];

    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    
    [self.locationManager requestAlwaysAuthorization];
}

#pragma mark - CLLocationManagerDelegate Methods
- (void)locationManagerDidChangeAuthorization:(CLLocationManager *)manager {
    CLAuthorizationStatus status = manager.authorizationStatus;
    
    if (status == kCLAuthorizationStatusAuthorizedAlways || status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        if ([CLLocationManager isMonitoringAvailableForClass:[CLBeaconRegion class]]) {
            if ([CLLocationManager isRangingAvailable]) {
                [self startScanning];
                
            } else {
                self.statusLabel.text = @"[SS] ranging not available.";
            }
        } else {
            self.statusLabel.text = @"[SS] Beacon monitoring not supported.";
        }
    } else if (status == kCLAuthorizationStatusDenied || status == kCLAuthorizationStatusRestricted) {
        self.statusLabel.text = @"[SS] Location permission denied.";
    }
}

//delegate method for ranging beacons.
- (void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray<CLBeacon *> *)beacons satisfyingConstraint:(CLBeaconIdentityConstraint *)beaconConstraint {
    self.rangedBeacons[beaconConstraint.UUID.UUIDString] = beacons;
    [self updateBeaconInfo];
}

- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region {
    NSLog(@"[SS] Entered region: %@", region.identifier);
}

- (void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region {
    NSLog(@"[SS] Exited region: %@", region.identifier);
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"[SS] Location Manager failed with error: %@", error.localizedDescription);
    self.statusLabel.text = [NSString stringWithFormat:@"Error: %@", error.localizedDescription];
} 

//- (void)monitoringManager:(CLMonitoringManager *)manager didFailWithError:(NSError *)error {
//    NSLog(@"[SS] Monitoring Manager failed with error: %@", error.localizedDescription);
//}


- (void)updateBeaconInfo {
    NSMutableString *beaconInfoText = [NSMutableString new];
    NSUInteger totalBeacons = 0;

    for (NSString *uuidString in self.rangedBeacons.allKeys) {
        NSArray<CLBeacon *> *beaconsInRegion = self.rangedBeacons[uuidString];
        if (beaconsInRegion.count > 0) {
            totalBeacons += beaconsInRegion.count;

            [beaconInfoText appendFormat:@"--- Beacons for UUID: %@ \n", uuidString];
            
            NSArray *sortedBeacons = [beaconsInRegion sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
                return [@(((CLBeacon *)obj1).rssi) compare:@(((CLBeacon *)obj2).rssi)];
            }];
            sortedBeacons = [[sortedBeacons reverseObjectEnumerator] allObjects];
            
            for (CLBeacon *beacon in sortedBeacons) {
                [beaconInfoText appendString:@"--------------------------------\n"];
                [beaconInfoText appendFormat:@"UUID: %@\n", beacon.UUID.UUIDString]; //deprecated proxmitiyUUID instead used UUID
                NSLog(@"[SS] UUID: %@",beacon.UUID.UUIDString);
                [beaconInfoText appendFormat:@"Major: %@\n", beacon.major];
                NSLog(@"[SS] Major: %@",beacon.major);
                [beaconInfoText appendFormat:@"Minor: %@\n", beacon.minor];
                NSLog(@"[SS] Minor: %@",beacon.minor);
                [beaconInfoText appendFormat:@"Proximity: %@\n", [self stringForProximity:beacon.proximity]];
                NSLog(@"[SS] Proximity: %@",[self stringForProximity:beacon.proximity]);
                [beaconInfoText appendFormat:@"Accuracy: %.2f meters\n", beacon.accuracy];
                NSLog(@"[SS] Accuracy: %.2f meters",beacon.accuracy);
                [beaconInfoText appendFormat:@"RSSI: %ld dBm\n\n", (long)beacon.rssi];
                NSLog(@"[SS] RSSI: %ld dBm",(long)beacon.rssi);
                //[beaconInfoText appendFormat:@"", beacon.p]
            }
        }
    }
    if (totalBeacons > 0) {
        self.statusLabel.text = [NSString stringWithFormat:@"Found %lu beacon(s) total", (unsigned long)totalBeacons];
    } else {
        self.statusLabel.text = @"Searching for beacons...";
        [beaconInfoText appendString:@"No beacons found in range."];
    }
    
    self.beaconInfoTextView.text = beaconInfoText;
}

- (void)startScanning {
    //Using UUID..
    NSArray<NSString *> *uuidsToMonitor = @[
        @"DE99A4A8-1466-4E8B-B27A-494888D92CF3",
        @"F7826DA6-4FA2-4E98-8024-BC5B71E0893E",
        @"19EE0388-4FEB-42AC-9B4C-2B6E8B3561BA"
    ];

    for (NSString *uuidString in uuidsToMonitor) {
        NSUUID *uuid = [[NSUUID alloc] initWithUUIDString:uuidString];
        
        // Use CLBeaconIdentityCondition for both ranging and monitoring.
        CLBeaconIdentityCondition *beaconCondition = [[CLBeaconIdentityCondition alloc] initWithUUID:uuid];
        NSString *identifier = [NSString stringWithFormat:@"Monitor-%@", uuidString];
        [self.monitoringManager addConditionForMonitoring:beaconCondition identifier:identifier];
        [self.locationManager startRangingBeaconsSatisfyingConstraint:beaconCondition];
    }
    
    self.statusLabel.text = @"Scanning for multiple beacon constraints...";
}

- (NSString *)stringForProximity:(CLProximity)proximity {
    switch (proximity) {
        case CLProximityUnknown:    return @"Unknown";
        case CLProximityImmediate:  return @"Immediate";
        case CLProximityNear:       return @"Near";
        case CLProximityFar:        return @"Far";
    }
}

@end

