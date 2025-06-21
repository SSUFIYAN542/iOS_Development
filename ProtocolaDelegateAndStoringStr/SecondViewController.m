//
//  SecondViewController.m
//  NavigatinScreenAndStoreData
//
//  Created by syed on 21/06/25.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

@synthesize txtLastName, delegate;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [txtLastName resignFirstResponder];
    [self.delegate setlastName:txtLastName.text];
}

- (void)doneBt:(id)sender{
    [txtLastName resignFirstResponder];
    [self.delegate setlastName:txtLastName.text];
    [self.delegate setBgColor:[UIColor orangeColor]];
    [self.delegate setTxtColor:[UIColor blueColor]];
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
