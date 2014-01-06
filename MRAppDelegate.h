//
//  MRAppDelegate.h
//  Speak It Like...
//
//  Created by Michael Robinson on 14/11/2013.
//  Copyright (c) 2013 Michael Robinson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MRAppDelegate : UIResponder <UIApplicationDelegate>{
    short networkConnections;
}

@property (strong, nonatomic) UIWindow *window;

-(void)addNetworkConnection;
-(void)removeNetworkConnection;
@end
