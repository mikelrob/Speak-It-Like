//
//  MRTextTranslator.m
//  Speak It Like...
//
//  Created by Michael Robinson on 18/11/2013.
//  Copyright (c) 2013 Michael Robinson. All rights reserved.
//

#import "MRYodaTranslator.h"
#import "MRAppDelegate.h"

@implementation MRYodaTranslator

-(void)translateText:(NSString *)textToTranslate{
    if (textToTranslate || textToTranslate.length != 0) {
        
        //start spinning network activity indicator
        [(MRAppDelegate *)([UIApplication sharedApplication].delegate) addNetworkConnection];
        //set up translation request
        NSDictionary* headers = @{@"X-Mashape-Authorization": @"6V0SuRAE3h4PDmjkJjKXSQQ7SCWXJ08l"};
        NSDictionary* parameters = @{};
        
        NSString *textToSend = [textToTranslate stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSString *urlString = [@"https://yoda.p.mashape.com/yoda?sentence=" stringByAppendingString:textToSend];
        
        //async get
        theConnection = [[UNIRest get:^(UNISimpleRequest* request) {
            [request setUrl:urlString];
            [request setHeaders:headers];
            [request setParameters:parameters];
        }] asStringAsync:^(UNIHTTPStringResponse *response, NSError *error) {
            // This is the asyncronous callback block

            self.translatedText = [response body];
            
            //stop spinning network activity indicator
            [(MRAppDelegate *)([UIApplication sharedApplication].delegate) removeNetworkConnection];
            
        }];
        
    }else{
        NSException *noTextException = [NSException exceptionWithName:@"No Text Exception" reason:@"There was no text to translate" userInfo:nil];
        @throw noTextException;
    }
}

-(NSString *)translatorName{
    return @"Yoda";
}

@end
