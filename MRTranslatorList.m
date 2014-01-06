//
//  MRTranslatorList.m
//  Speak It Like...
//
//  Created by Michael Robinson on 26/11/2013.
//  Copyright (c) 2013 Michael Robinson. All rights reserved.
//

#import "MRTranslatorList.h"

@implementation MRTranslatorList

- (MRTranslatorList *)init{
    if (self = [super init]) {
        MRYodaTranslator *yoda = [MRYodaTranslator new];
        
        //init other translators here and add as next element to array
        
        storageArray = [NSArray arrayWithObjects:yoda, nil];
    }
    
    return self;
}

-(NSUInteger)count{
    return [storageArray count];
}

-(NSString *)nameForTranslatorAtIndex:(NSInteger)index{
    return [[storageArray objectAtIndex:index] translatorName];
}

-(MRTextTranslator *)translatorAtIndex:(NSInteger)index{
    return [storageArray objectAtIndex:index];
}

-(NSArray *)allTranslators{
    return storageArray;
}
@end
