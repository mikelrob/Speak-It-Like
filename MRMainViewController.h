//
//  MRMainViewController.h
//  Speak It Like...
//
//  Created by Michael Robinson on 14/11/2013.
//  Copyright (c) 2013 Michael Robinson. All rights reserved.
//

#import "MRFlipsideViewController.h"
#import "MRTranslatorList.h"
#import "MRTextWithSpinnerCell.h"
#import "MRTranslatedTextViewController.h"

@interface MRMainViewController : UIViewController <MRFlipsideViewControllerDelegate, UIPopoverControllerDelegate, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>{
    BOOL isLoading;
    MRTranslatorList *translatorList;
    IBOutlet UITableView* theTableView;
    IBOutlet UITextField* inputTextField;
    MRTextWithSpinnerCell *activeCell;
}

@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;

@end
