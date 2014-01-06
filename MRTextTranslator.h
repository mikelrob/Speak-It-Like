//
//  MRTextTranslator.h
//  Speak It Like...
//
//  Created by Michael Robinson on 18/11/2013.
//  Copyright (c) 2013 Michael Robinson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MRTextTranslator : NSObject{
    NSString *TranslatedTextKeyPath;
}

@property(strong, nonatomic)NSString *translatedText;

+(NSString *)translatedTextKeyPath;

-(NSString *)translatorName;
-(void)translateText:(NSString *)textToTranslate;
    
@end
