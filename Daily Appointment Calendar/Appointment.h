//
//  Appointment.h
//  Daily Appointment Calendar
//
//  Created by Christopher Szatmary on 2017-03-02.
//  Copyright © 2017 Christopher Szatmary. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Appointment : NSObject

@property (strong, nonatomic) NSDate *date;

@property (strong, nonatomic) NSString *name;

-(id)initWithName:(NSString *)name atDate:(NSDate *)date;

-(NSString *)dateTime;

-(NSComparisonResult)compare:(Appointment *)appointment;

- (NSString *)description;

@end
