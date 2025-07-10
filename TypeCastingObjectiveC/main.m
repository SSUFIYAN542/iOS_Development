//
//  main.m
//  TypeCastingObjectiveC
//
//  Created by syed on 10/07/25.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    
    //UpCasting: Cat -> Animal (implicit)
    Cat *cat = [Cat new];
    Animal *animal = cat;
    [animal speaks];
    
    //DownCasting: Animal -> Cat (need to check with inKindOfCall)
    if([animal isKindOfClass:[Cat class]]){
        Cat *downCastedCat = (Cat *)animal;
        [downCastedCat meow];
    }else{
        NSLog(@"DownCasting fialed");
    }
    
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}


//isKindOfClass method is from NSObject used to check at runtime whether an object is an instance of sepecific class or a subClass of that class.
