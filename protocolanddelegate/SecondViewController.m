//
//  SecondViewController.m
//  protocolanddelegate
//
//  Created by syed on 07/05/24.
//
#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController
@synthesize txtlastname,obj;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//simulator view appear
- (void)viewWillAppear:(BOOL)animated{
    [txtlastname resignFirstResponder];
    [self.obj setLastname:txtlastname.text];//method setlastname txtlastname is set.
    NSLog(@"viewWillAppear Second View");
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)Btndone:(id)sender {
    [txtlastname resignFirstResponder];
    [self.obj setLastname:txtlastname.text];
    [self.obj setbgcolor:[UIColor blueColor]];
    [self.obj settextcolor:[UIColor whiteColor]];
    [self.navigationController popViewControllerAnimated:YES];
    NSLog(@"Btndone");
}
@end
