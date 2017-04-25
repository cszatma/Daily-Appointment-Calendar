//
//  NSDate+CustomDate.h
//  Daily Appointment Calendar
//
//  Created by Christopher Szatmary on 2017-03-01.
//  Copyright © 2017 Christopher Szatmary. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(int, DateFormatType) {
    DateFormat_MM_dd_yyyy,
    DateFormat_E_MMMd_yyyy,
    DateFormat_H_mm
};

@interface NSDate (CustomDate)

-(id)initWithFormatedString:(NSString *)dateString format:(DateFormatType)format;

-(NSString *)stringFromDateWithFormat:(DateFormatType)format;

-(id)initWithHourInterval:(double)hours sinceDate:(NSDate *)date;

-(NSDate *)addHours:(double)hours;

-(NSDateComponents *)getComponents;

-(id)initWithComponentsDay:(NSInteger)day month:(NSInteger)month year:(NSInteger)year hour:(NSInteger)hour minute:(NSInteger)minute;

@end
