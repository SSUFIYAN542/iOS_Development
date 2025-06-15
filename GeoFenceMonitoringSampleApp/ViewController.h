//
//  ViewController.h
//  geoFenceSample1
//
//  Created by syed on 14/06/25.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <UserNotifications/UserNotifications.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate>
@property (strong, nonatomic) CLLocationManager *locationManager;
@end



