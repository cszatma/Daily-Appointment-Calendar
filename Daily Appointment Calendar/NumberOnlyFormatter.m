//
//  NumberOnlyFormatter.m
//  Daily Appointment Calendar
//
//  Created by Christopher Szatmary on 2017-03-03.
//  Copyright © 2017 Christopher Szatmary. All rights reserved.
//

#import "NumberOnlyFormatter.h"

@implementation NumberOnlyFormatter

- (BOOL)isPartialStringValid:(NSString*)partialString newEditingString:(NSString**)newString errorDescription:(NSString**)error
{
    if([partialString length] == 0) {
        return YES;
    }
    
    NSScanner* scanner = [NSScanner scannerWithString:partialString];
    
    if(!([scanner scanInt:0] && [scanner isAtEnd])) {
        NSBeep();
        return NO;
    }
    
    return YES;
}


@end
