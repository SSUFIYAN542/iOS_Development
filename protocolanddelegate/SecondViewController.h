//
//  SecondViewController.h
//  protocolanddelegate
//
//  Created by syed on 07/05/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ABC <NSObject>

-(void)setLastname:(NSString*)lastname;
-(void)setbgcolor:(UIColor*)bgcolor;
-(void)settextcolor:(UIColor*)textcolor;

@end

@interface SecondViewController : UIViewController

@property(retain,nonatomic) id<ABC> obj;//Protocol object
@property (strong, nonatomic) IBOutlet UITextField *txtlastname;
- (IBAction)Btndone:(id)sender;

@end

NS_ASSUME_NONNULL_END
