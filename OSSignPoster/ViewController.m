//
//  ViewController.m
//  PerformanceIntervalPoster
//
//  Created by syed on 26/08/25.
//

#import "ViewController.h"
#import "PerformanceTester.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    PerformanceTester *tester = [PerformanceTester new];
        [tester measureOSLevelAPICall];
}


@end
