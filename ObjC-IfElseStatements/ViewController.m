//
//  ViewController.m
//  IfElseStamentSample
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
    
    
    BOOL state = NO;
    
    if(state){
        self.label.text = @"hey!! allow access";
    }else{
        self.label.text = @"Oops! deny access";
    }
    
    
    NSString *name = @"Sufiyan";
    if([name isEqualToString:@"Sufiyan"]){
        self.label1.text = @"Nice Name";
    }else if([name isEqualToString:@"Syed"]){
        self.label1.text = @"Good name";
    }else{
        self.label1.text = @"Outoff";
    }
    
    NSInteger n = 10;
    if(n < 100){
        self.label2.text = [NSString stringWithFormat:@"%ld is les then 100 ", (long)n];
    }else{
        self.label2.text = [NSString stringWithFormat:@"%ld is greater then 100 ", (long)n];
    }
}


@end
