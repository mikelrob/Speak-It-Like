//
//  MRTranslatorList.h
//  Speak It Like...
//
//  Created by Michael Robinson on 26/11/2013.
//  Copyright (c) 2013 Michael Robinson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MRYodaTranslator.h"

@interface MRTranslatorList : NSObject{
    NSArray *storageArray;
}

-(NSUInteger)count;
-(NSString *)nameForTranslatorAtIndex:(NSInteger)index;
-(MRTextTranslator *)translatorAtIndex:(NSInteger)index;
-(NSArray *)allTranslators;

@end
