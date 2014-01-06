//
//  MRFlipsideViewController.h
//  Speak It Like...
//
//  Created by Michael Robinson on 14/11/2013.
//  Copyright (c) 2013 Michael Robinson. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MRFlipsideViewController;

@protocol MRFlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(MRFlipsideViewController *)controller;
@end

@interface MRFlipsideViewController : UIViewController

@property (weak, nonatomic) id <MRFlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end
