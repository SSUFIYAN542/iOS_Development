//
//  ViewController.m
//  Demo_VariableConst
//
//  Created by syed on 09/06/25.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    ////String..
    //created varibale in .h file with String Data type..
    name = @"syed";
    //reassigning the name
    name = @"sufiyan";
    NSLog(@"name = %@", name);
    
    
    
    //Constant string..
    NSString * const names = @"SYED";
    NSLog(@"const = %@",names);
    
    //can't assign varibale names because it is already assigned for constant type..
    //names = @"ss";
    
    NSString * const n;
    //now we cann't assigne the value to n because it is already given const while creating..
    //n = @"sss";
    NSLog(@"n = %@",n);//null
    
    
    ////Int
    num = 10;
    NSLog(@"num = %d",num);
    
    const int  nums = 200;
    NSLog(@"nums = %d",nums);
    
    NSInteger const nn = 20;
    //nn = 30;
    
    
    
    //Creating label and adding the text into it..
    NSString *n1 = @"Hello";
    NSString *n2 = @"sufiyan";
    //self.label.text  = @"Sufiyan";
    self.label.text = [NSString stringWithFormat:@"%@ %@",n1, n2];
    
    
    //Int to String:   displaying the integer value in text label..
    score = 90;
    bonus = 10;
    checkpoint = 120;
    
    int finalScore = score + bonus + checkpoint;
    //self.label2.text = finalScore; //this will give error implicit conversation int to NSString.
    self.label2.text = [NSString stringWithFormat:@"%d", finalScore];
    
    
    //Float and Double adding in text label.
    float1 = 12.99;
    float2 = 15.555;
    
    float calculateFloat = float1 + float2;
    self.label3.text = [NSString stringWithFormat:@"%f", calculateFloat];
    //if we want to display the decimal point digit number as accordingly then specify infront of f as(.number f) down below
    ///self.label3.text = [NSString stringWithFormat:@"%.4f", calculateFloat];
    
    double1 = 100.90;
    double2 = 45.55;
    
    double calculateDouble = double1 + double2;
    self.label4.text = [NSString stringWithFormat:@"%.2f", calculateDouble];
    
    
    //Boolean enabling/disabling the button and switch(on/off) by using boolean values..
    // we can define boolean values as TRUE/FALSE or YES/NO..
    bool1 = TRUE;
    bool2 = FALSE;
    
    self.button.enabled = bool1; //button.
    self.mySwitch.on = bool2; //Switch.
    
    
    
    
}



@end
