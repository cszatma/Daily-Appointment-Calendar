//
//  NSArray+AppointmentArray.m
//  Daily Appointment Calendar
//
//  Created by Christopher Szatmary on 2017-03-04.
//  Copyright © 2017 Christopher Szatmary. All rights reserved.
//

#import "NSArray+AppointmentArray.h"

@implementation NSArray (AppointmentArray)

-(NSUInteger)indexOfAppointmentWithDate:(NSDate *)date {
    for (Appointment *a in self) {
        if (a.date == date) {
            return [self indexOfObject:a];
        }
    }
    return NSNotFound;
}

@end
