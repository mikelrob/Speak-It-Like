//
//  MRTextWithSpinnerCell.m
//  Speak It Like...
//
//  Created by Michael Robinson on 29/11/2013.
//  Copyright (c) 2013 Michael Robinson. All rights reserved.
//

#import "MRTextWithSpinnerCell.h"

@implementation MRTextWithSpinnerCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        self.activityIndicatorView.frame = CGRectMake(263, 3, 37, 37);
//        self.activityIndicatorView
        [self.contentView addSubview:self.activityIndicatorView];
    }
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
