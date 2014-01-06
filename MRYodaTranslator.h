//
//  MRTextTranslator.h
//  Speak It Like...
//
//  Created by Michael Robinson on 18/11/2013.
//  Copyright (c) 2013 Michael Robinson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MRTextTranslator.h"
#import "UNIRest.h"

@interface MRYodaTranslator : MRTextTranslator{
    UNIUrlConnection *theConnection;
    NSInteger *code;
    NSDictionary *responseHeaders;
    NSString *body;
    NSData *rawBody;
}

@end
