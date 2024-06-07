//
//  ViewController.h
//  protocolanddelegate
//
//  Created by syed on 07/05/24.
//

#import <UIKit/UIKit.h>
#import "SecondViewController.h"

@interface ViewController : UIViewController<ABC>//Declare Delegate
@property (strong, nonatomic) IBOutlet UITextField *txtfirstname;
@property (strong, nonatomic) IBOutlet UITextField *txtfullname;


@end

