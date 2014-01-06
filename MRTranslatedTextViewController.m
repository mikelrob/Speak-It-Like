//
//  MRTranslatedTextViewController.m
//  Speak It Like...
//
//  Created by Michael Robinson on 28/11/2013.
//  Copyright (c) 2013 Michael Robinson. All rights reserved.
//

#import "MRTranslatedTextViewController.h"

@interface MRTranslatedTextViewController ()

@end

@implementation MRTranslatedTextViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
//    dispatch_async(dispatch_get_main_queue(), ^{
//        // do work here
        translatorNameLabel.text = self.translatorName;
        translatedTextLabel.text = self.translatedText;
//    });
}

-(void)doneButtonPressed:(id)sender{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:^{}];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
