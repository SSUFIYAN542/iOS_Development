//
//  SecondViewController.h
//  NavigatinScreenAndStoreData
//
//  Created by syed on 21/06/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@protocol ABC <NSObject>
-(void)setlastName:(NSString *) lastName;
-(void)setBgColor:(UIColor*)bgColor;
-(void)setTxtColor:(UIColor*)txtColor;
@end

@interface SecondViewController : UIViewController

@property(retain, nonatomic) id<ABC> delegate;//Protocol object
@property (strong, nonatomic) IBOutlet UITextField *txtLastName;
- (IBAction)doneBt:(id)sender;

@end

NS_ASSUME_NONNULL_END
