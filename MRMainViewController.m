//
//  MRMainViewController.m
//  Speak It Like...
//
//  Created by Michael Robinson on 14/11/2013.
//  Copyright (c) 2013 Michael Robinson. All rights reserved.
//

#import "MRMainViewController.h"
#import "MRAppDelegate.h"

@interface MRMainViewController ()

@end

@implementation MRMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    isLoading = NO;
    translatorList = [MRTranslatorList new];
    
    NSArray *translators = [translatorList allTranslators];
    for (MRTextTranslator *translator in translators) {
        [translator addObserver:self forKeyPath:[MRTextTranslator translatedTextKeyPath] options:NSKeyValueObservingOptionNew context:nil];
    }
//    UINib *cellNib = [UINib nibWithNibName:@"MRTextWithSpinnerCell" bundle:[NSBundle mainBundle]];
//    [theTableView registerNib:cellNib forCellReuseIdentifier:@"textWithSpinner"];
}

- (void)viewDidAppear:(BOOL)animated{
    [inputTextField setEnabled:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - KVO method

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if ([keyPath caseInsensitiveCompare:[MRTextTranslator translatedTextKeyPath]] == NSOrderedSame) {
        
        //key value changed on background thread so ensure changes to UI happen on main thread
        dispatch_async(dispatch_get_main_queue(), ^{
            //present new view
            [self performSegueWithIdentifier:@"showTranslated" sender:object];
            [activeCell.activityIndicatorView stopAnimating];
            [(MRAppDelegate *)([UIApplication sharedApplication].delegate) removeNetworkConnection];
        });
    }
}

#pragma mark - UITableViewDataSource methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [translatorList count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellID = @"textWithSpinner";
    MRTextWithSpinnerCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[MRTextWithSpinnerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = [translatorList nameForTranslatorAtIndex:indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate methods

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    //hide keyboard and stop focus on textfield
    [inputTextField resignFirstResponder];
    [inputTextField setEnabled:NO];
    
    if (!isLoading) {
        
        isLoading = YES;
        if ([inputTextField.text isEqualToString:@""]) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Text to translate!"
                                                            message:@"Please enter a sentence to translate."
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
            isLoading = NO;
            [inputTextField setEnabled:YES];
        } else {
            
            //sent text to translator
            MRTextTranslator *translator = [translatorList translatorAtIndex:indexPath.row];
            [translator translateText:inputTextField.text];
            
            
            [inputTextField resignFirstResponder];
            
            //start spinner in cell
            MRTextWithSpinnerCell *cell = (MRTextWithSpinnerCell *)[tableView cellForRowAtIndexPath:indexPath];
            activeCell = cell;
            [cell.activityIndicatorView startAnimating];
            [(MRAppDelegate *)([UIApplication sharedApplication].delegate) addNetworkConnection];
            
        }
    }
    //un-highlight the tapped cell
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - UITextFieldDelegate methods

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - Flipside View Controller

- (void)flipsideViewControllerDidFinish:(MRFlipsideViewController *)controller
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.flipsidePopoverController dismissPopoverAnimated:YES];
    }
}

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    self.flipsidePopoverController = nil;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
        
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            UIPopoverController *popoverController = [(UIStoryboardPopoverSegue *)segue popoverController];
            self.flipsidePopoverController = popoverController;
            popoverController.delegate = self;
        }
    } else if ([[segue identifier] isEqualToString:@"showTranslated"]) {
        isLoading = NO;
//        [activeCell.activityIndicatorView stopAnimating];
        MRTranslatedTextViewController *dvc = [segue destinationViewController];
        dvc.translatorName = [(MRTextTranslator *)(sender) translatorName];
        dvc.translatedText = [(MRTextTranslator *)(sender) translatedText];
    }
}

- (IBAction)togglePopover:(id)sender
{
    if (self.flipsidePopoverController) {
        [self.flipsidePopoverController dismissPopoverAnimated:YES];
        self.flipsidePopoverController = nil;
    } else {
        [self performSegueWithIdentifier:@"showAlternate" sender:sender];
    }
}

@end
