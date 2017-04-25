//
//  Appointment.m
//  Daily Appointment Calendar
//
//  Created by Christopher Szatmary on 2017-03-02.
//  Copyright © 2017 Christopher Szatmary. All rights reserved.
//

#import "Appointment.h"

@implementation Appointment

-(id)initWithName:(NSString *)name atDate:(NSDate *)date {
    if (self = [super init]) {
        self.name = name;
        self.date = date;
        return self;
    }
    return nil;
}

-(NSString *)description {
    return [NSString stringWithFormat:@"%@, %@", self.name, self.date];
}

-(NSString *)dateTime {
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"H: m";
    [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"]];
    return [formatter stringFromDate:self.date];
}

-(NSComparisonResult)compare:(Appointment *)appointment {
    return [self.date compare:appointment.date];
}

@end
