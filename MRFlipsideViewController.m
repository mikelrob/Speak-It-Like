//
//  MRFlipsideViewController.m
//  Speak It Like...
//
//  Created by Michael Robinson on 14/11/2013.
//  Copyright (c) 2013 Michael Robinson. All rights reserved.
//

#import "MRFlipsideViewController.h"

@interface MRFlipsideViewController ()

@end

@implementation MRFlipsideViewController

- (void)awakeFromNib
{
    self.preferredContentSize = CGSizeMake(320.0, 480.0);
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewControllerDidFinish:self];
}

@end
