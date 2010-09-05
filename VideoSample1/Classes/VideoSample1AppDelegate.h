//
//  VideoSample1AppDelegate.h
//  VideoSample1
//
//  Created by mmlemon on 10/09/06.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VideoSample1ViewController;

@interface VideoSample1AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    VideoSample1ViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet VideoSample1ViewController *viewController;

@end

