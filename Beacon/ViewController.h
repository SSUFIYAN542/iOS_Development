//
//  ViewController.h
//  DemoIBeaconApp
//
//  Created by syed on 24/07/25.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate>
@property (strong, nonatomic) IBOutlet UILabel *statusLabel;
@property (strong, nonatomic) IBOutlet UITextView *beaconInfoTextView;

@end

