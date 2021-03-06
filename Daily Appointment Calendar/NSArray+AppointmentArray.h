//
//  NSArray+AppointmentArray.h
//  Daily Appointment Calendar
//
//  Created by Christopher Szatmary on 2017-03-04.
//  Copyright © 2017 Christopher Szatmary. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Appointment.h"

@interface NSArray (AppointmentArray)

-(NSUInteger)indexOfAppointmentWithDate:(NSDate *)date;

@end
