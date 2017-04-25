//
//  NSTextField+ExtendedTextField.m
//  Daily Appointment Calendar
//
//  Created by Christopher Szatmary on 2017-03-02.
//  Copyright © 2017 Christopher Szatmary. All rights reserved.
//

#import "NSTextField+ExtendedTextField.h"

@implementation NSTextField (ExtendedTextField)

-(BOOL)textIsEmpty {
    return [[self stringValue] isEqualToString:@""];
}

@end
