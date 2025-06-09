//
//  ViewController.m
//  ArraysSample
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
    
    //Creating array and adding elements into it..
    NSArray *arr = @[@"Apple", @"Banana", @"Mango", @"ButterFruite" ];
    
    self.label.text = arr[3]; //getting 2index ele..
    
    
    //Creating Mutable array where it can add/remove in between the array ele and by accessing with indec value.
    NSMutableArray *array = [[NSMutableArray alloc]
                             initWithObjects:@"Apple", @"Banana", @"Mango", @"ButterFrute", nil];
    [array addObject:@"Watermelon"]; //this will add in the end of the array.
    
    [array removeObject:@"Mango"];// removing the ele.
    [array removeObjectAtIndex:0]; //removing the ele at perticular index.
    [array insertObject:@"Mango" atIndex:0];
    
    self.label2.text = array[0];
    
    
    
    
}


@end
