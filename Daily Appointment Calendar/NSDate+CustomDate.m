//
//  NSDate+CustomDate.m
//  Daily Appointment Calendar
//
//  Created by Christopher Szatmary on 2017-03-01.
//  Copyright © 2017 Christopher Szatmary. All rights reserved.
//

#import "NSDate+CustomDate.h"

@implementation NSDate (CustomDate)

-(id)initWithFormatedString:(NSString *)dateString format:(DateFormatType)format {
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = [self getFormatWithType:format];
    [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"]];
    NSDate *date = [formatter dateFromString:dateString];
    return [self initWithTimeInterval:0 sinceDate:date];
}

-(NSString *)stringFromDateWithFormat:(DateFormatType)format {
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = [self getFormatWithType:format];
    [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"]];
    return [formatter stringFromDate:self];
}

-(id)initWithHourInterval:(double)hours sinceDate:(NSDate *)date {
    NSTimeInterval interval = hours * 60 * 60;
    return [self initWithTimeInterval:interval sinceDate:date];
}

-(NSDate *)addHours:(double)hours {
    return [[NSDate alloc] initWithHourInterval:hours sinceDate:self];
}

-(NSDateComponents *)getComponents {
    unsigned unitFlags = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear;
    NSCalendar *cal = [[NSCalendar currentCalendar] copy];
    NSDateComponents *comp = [cal components:unitFlags fromDate:self];
    [comp setCalendar:cal];
    
    return comp;
}

-(id)initWithComponentsDay:(NSInteger)day month:(NSInteger)month year:(NSInteger)year hour:(NSInteger)hour minute:(NSInteger)minute {
    NSDateComponents *comp = [NSDateComponents new];
    NSCalendar *cal = [[NSCalendar currentCalendar] copy];
    cal.timeZone = [NSTimeZone localTimeZone];
    cal.locale = [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
    [comp setCalendar: cal];
    comp.day = day;
    comp.month = month;
    comp.year = year;
    comp.hour = hour;
    comp.minute = minute;
    return [self initWithTimeInterval:0 sinceDate:comp.date];
}

-(NSString *)getFormatWithType:(DateFormatType)type {
    
    switch (type) {
        case DateFormat_MM_dd_yyyy:
            return @"MM-dd-yyyy";
            break;
        case DateFormat_E_MMMd_yyyy:
            return @"E, MMM d, yyyy";
            break;
        case DateFormat_H_mm:
            return @"H:mm";
            break;
    }
}

@end
