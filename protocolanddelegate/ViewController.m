//
//  ViewController.m
//  protocolanddelegate
//
//  Created by syed on 07/05/24.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize txtfullname,txtfirstname;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [txtfirstname resignFirstResponder];
    NSLog(@"viewWillAppear First View");
}

- (void)setLastname:(NSString *)lastname
{
    NSString * mainStr = [NSString stringWithFormat:@"%@ %@",
                          txtfirstname.text,lastname];//mainStr = firstname + lastname
    txtfullname.text = mainStr;// mainStr assign to textFullname
    NSLog(@"textFullname");
}

- (void)settextcolor:(UIColor *)textcolor
{
    txtfullname.textColor = textcolor;//fullname text
}

- (void)setbgcolor:(UIColor *)bgcolor
{
    txtfullname.backgroundColor = bgcolor;//fullname background
}

//to go for Second View Controller.
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    SecondViewController *sec = [segue destinationViewController];
    sec.obj = self;
    NSLog(@"prepareForSegue");
}

@end
