//
//  ViewController.m
//  Daily Appointment Calendar
//
//  Created by Christopher Szatmary on 2017-03-01.
//  Copyright © 2017 Christopher Szatmary. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize selectedDate;
@synthesize appointments;


- (void)viewDidLoad {
    [super viewDidLoad];
    appointments = [NSMutableDictionary new]; //Create new appointments dictionary.
    NumberOnlyFormatter *nf = [NumberOnlyFormatter new];
    //Used to ensure that only numbers can be added into the textfields.
    for (NSView *view in [self.view subviews]) {
        if ([view isKindOfClass:[NSBox class]]) { //Check if view is a NSBox.
            for (NSView *control in [view subviews]) {
                NSLog(@"%hhd", [control isKindOfClass:[NSTextField class]]);
                if ([control isKindOfClass:[NSTextField class]] && control != self.txtDescription) {
                    NSTextField *textField = (NSTextField *)control;
                    [textField setFormatter:nf];
                }
            }
        }
    }
    
    [self updateCalenderWithDate:[NSDate new]]; //Sets the date to the current date when the program starts.
    
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    // Update the view, if already loaded.
}

- (void)updateCalenderWithDate:(NSDate *)date {
    selectedDate = date; //Updates the current date being viewed.
    [self.lblDate setStringValue: [selectedDate formatedStringFromDateWithFormat: E_MMMd_yyyy]]; //Sets lblDate to the selected date.
    [self updateDailyViewWithArray:[appointments objectForKey:[selectedDate formatedStringFromDateWithFormat:MM_dd_yyyy]]];
}

-(IBAction)adjustDateButtons_Click:(id)sender {
    double hours = [sender tag] == 1 ? -24 : 24; //Determines if previous or next button was clicked.
    [self updateCalenderWithDate:[[NSDate alloc] initWithHourInterval:hours sinceDate:selectedDate]]; //Sets the current date.
}

- (IBAction)showButton_Click:(id)sender {
    NSDateComponents *comp = [selectedDate getComponents]; //Used to create a new date with the components the user entered.
    comp.day = [self.txtDay textIsEmpty] ? comp.day : [[self.txtDay stringValue] integerValue];
    comp.month = [self.txtMonth textIsEmpty] ? comp.month : [[self.txtMonth stringValue] integerValue];
    comp.year = [self.txtYear textIsEmpty] ? comp.year : [[self.txtYear stringValue] integerValue];
    [self updateCalenderWithDate:comp.date];
}

- (IBAction)createButton_Click:(id)sender {
    if ([self.txtDescription.string isEqualToString:@""]) { //Checking to make sure a description was entered.
        return; //Return if no description.
    }
    
    NSDate *appointTime; //Time the user specified.
    NSString *key; //Key used to access the NSDictionary.
    [self setUpAppointmentWithTime:&appointTime andKey:&key]; //Get the appointTime and key objects.
    Appointment *appoint = [[Appointment alloc] initWithName:self.txtDescription.string atDate:appointTime]; //Appointment based on data entered by user.
    NSMutableArray *apptsArr; //Mutable Array to store all appointments in the given day.
    if ((apptsArr = [appointments objectForKey:key])) { //Checking to see if an array for the current day already exists in the Appointments dictionary.
        if ([apptsArr indexOfAppointmentWithDate:appointTime] != NSNotFound) {
            self.txtDescription.string = @"CONFLICT!!";
            return;
        }
        [apptsArr addObject:appoint]; //Add the appointment to the array.
        [apptsArr sortUsingSelector:@selector(compare:)]; //Sort the array to make sure it is in order.
    } else {
        apptsArr = [[NSMutableArray alloc] initWithObjects:appoint, nil]; //Creates a array if one doesn't exists and add the appointment to it.
    }
    [appointments setObject:apptsArr forKey:key]; //Add the array to the dictionary.
    [self updateDailyViewWithArray:apptsArr]; //Update the scrollview so the new appointment is shown.
}

- (IBAction)cancelButton_Click:(id)sender {
    NSDate *appointTime; //Time the user specified.
    NSString *key; //Key used to access the NSDictionary.
    [self setUpAppointmentWithTime:&appointTime andKey:&key];
    NSMutableArray *apptsArr = [appointments objectForKey:key];
    NSUInteger index = [apptsArr indexOfAppointmentWithDate:appointTime]; //Gets the index of the object with the same time as entered by the user, if it exists
    if (index == NSNotFound) //Checking to see if the appointment exists.
    {
        return; //Appointment doesn't exits; do nothing.
    }
    [apptsArr removeObjectAtIndex:index]; //Remove the appointment from the array.
    [appointments setObject:apptsArr forKey:key]; //Update the dictionary.
    [self updateDailyViewWithArray:apptsArr]; //Update the scrollview.
}

-(void)setUpAppointmentWithTime:(NSDate **)time andKey:(NSString **)key {
    NSDateComponents *comp = [selectedDate getComponents];
    NSInteger hour = [self.txtHour textIsEmpty] ? 0 : [self.txtHour.stringValue integerValue];
    NSInteger minutes = [self.txtMinute textIsEmpty] ? 0 : [self.txtMinute.stringValue integerValue];
    *time = [[NSDate alloc] initWithComponentsDay:comp.day month:comp.month year:comp.year hour:hour minute:minutes];
    *key = [self.selectedDate formatedStringFromDateWithFormat:MM_dd_yyyy];
}

-(void)updateDailyViewWithArray:(NSMutableArray *)array {
    NSMutableString *text = [NSMutableString new];
    for (Appointment *a in array) {
        [text appendString:[NSString stringWithFormat:@"%@ %@\n\n", [a.date formatedStringFromDateWithFormat:H_mm], a.name]];
    }
    self.textView.string = text;
}

@end
