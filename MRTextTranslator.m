//
//  MRTextTranslator.m
//  Speak It Like...
//
//  Created by Michael Robinson on 25/11/2013.
//  Copyright (c) 2013 Michael Robinson. All rights reserved.
//

#import "MRTextTranslator.h"

@implementation MRTextTranslator

+(NSString *)translatedTextKeyPath{
    return @"translatedText";
}

- (NSString *)translatorName{
    @throw [NSException exceptionWithName:@"noImplementation" reason:@"This is an abstract class and it's methods should be overridden before instantiated" userInfo:nil];
}

-(void)translateText:(NSString *)textToTranslate{
    @throw [NSException exceptionWithName:@"noImplementation" reason:@"This is an abstract class and it's methods should be overridden before instantiated" userInfo:nil];
}

@end
