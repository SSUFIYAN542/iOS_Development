//
//  ViewController.h
//  Demo_VariableConst
//
//  Created by syed on 09/06/25.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    NSString *name;
    
    int num;
    
    
    int score;
    int bonus;
    int checkpoint;
    
    
    float float1;
    float float2;
    
    double double1;
    double double2;
    
    bool bool1;
    bool bool2;
}

@property (strong, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) IBOutlet UILabel *label2;
@property (strong, nonatomic) IBOutlet UILabel *label3;
@property (strong, nonatomic) IBOutlet UILabel *label4;
@property (strong, nonatomic) IBOutlet UIButton *button;
@property (strong, nonatomic) IBOutlet UISwitch *mySwitch;


@end

