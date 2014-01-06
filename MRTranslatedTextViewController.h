//
//  MRTranslatedTextViewController.h
//  Speak It Like...
//
//  Created by Michael Robinson on 28/11/2013.
//  Copyright (c) 2013 Michael Robinson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MRTranslatedTextViewController : UIViewController{
    IBOutlet UILabel *translatorNameLabel;
    IBOutlet UILabel *translatedTextLabel;
    
}

@property (nonatomic, strong)NSString *translatorName;
@property (nonatomic, strong)NSString *translatedText;

-(IBAction)doneButtonPressed:(id)sender;

@end
