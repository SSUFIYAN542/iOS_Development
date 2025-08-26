//
//  PerformanceTester.m
//  PerformanceIntervalPoster
//
//  Created by syed on 26/08/25.
//

#import "PerformanceTester.h"
#import <os/signpost.h>
#import <os/log.h>
#import <Foundation/Foundation.h>

@implementation PerformanceTester

- (void)measureOSLevelAPICall {
    os_log_t logHandle = os_log_create("com.yourcompany.app", "Performance");

    //unique signpost ID for this interval
    os_signpost_id_t signpostId = os_signpost_id_generate(logHandle);

//    os_signpost_interval_begin(logHandle, signpostId, "OSLevelAPI_Call", "Start of API call");
//    our logic
//    os_signpost_interval_end(logHandle, signpostId, "OSLevelAPI_Call", "End of API call");
    
    os_signpost_interval_begin(logHandle, signpostId, "OSLevelAPI_Call", "%{public}s", "Start of API call");
    os_signpost_event_emit(logHandle, signpostId, "OSLevelAPI_Call: Start of API call");

    [self callOSLevelAPI];

    os_signpost_interval_end(logHandle, signpostId, "OSLevelAPI_Call", "%{public}s", "End of API call");
    os_signpost_event_emit(logHandle, signpostId, "OSLevelAPI_Call: End of API call");
}

- (void)callOSLevelAPI {
    //OS-level API call: getting iOS system version
    NSOperatingSystemVersion version = [[NSProcessInfo processInfo] operatingSystemVersion];
    NSLog(@"Current iOS System Version: %ld.%ld.%ld",
          (long)version.majorVersion,
          (long)version.minorVersion,
          (long)version.patchVersion);

    // Optional: simulate some delay to visualize the interval better
    //[NSThread sleepForTimeInterval:1.0];
}

@end


