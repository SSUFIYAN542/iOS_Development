//
//  AppDelegate.h
//  TypeCastingObjectiveC
//
//  Created by syed on 10/07/25.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@end



@interface Animal : NSObject

-(void)speaks;

@end

@interface Cat : Animal
-(void)meow;
@end



