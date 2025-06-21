//
//  ViewController.m
//  NavigatinScreenAndStoreData
//
//  Created by syed on 21/06/25.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize  txtFullName,txtFirstName;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [txtFirstName resignFirstResponder];
}

- (void)setlastName:(NSString *)lastName{
    NSString * mainStr = [NSString stringWithFormat:@"%@ %@", txtFirstName.text, lastName];
    
   txtFullName.text = mainStr;
}

- (void)setTxtColor:(UIColor *)txtColor{
    txtFullName.textColor = txtColor;
}

- (void)setBgColor:(UIColor *)bgColor{
    txtFullName.backgroundColor = bgColor;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    SecondViewController *se = [segue destinationViewController];
    se.delegate = self;
}


@end
