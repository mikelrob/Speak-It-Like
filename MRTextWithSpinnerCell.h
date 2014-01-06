//
//  MRTextWithSpinnerCell.h
//  Speak It Like...
//
//  Created by Michael Robinson on 29/11/2013.
//  Copyright (c) 2013 Michael Robinson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MRTextWithSpinnerCell : UITableViewCell{
    IBOutlet UILabel *translatorNameLabel;
}

@property(strong, nonatomic)IBOutlet UIActivityIndicatorView *activityIndicatorView;

@end
