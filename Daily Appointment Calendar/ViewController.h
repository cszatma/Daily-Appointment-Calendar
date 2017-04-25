//
//  ViewController.h
//  Daily Appointment Calendar
//
//  Created by Christopher Szatmary on 2017-03-01.
//  Copyright © 2017 Christopher Szatmary. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController

@property (weak) IBOutlet NSTextFieldCell *lblDate;

@property (weak) IBOutlet NSTextView *textView;

@property (weak) IBOutlet NSTextField *txtDay;

@property (weak) IBOutlet NSTextField *txtMonth;

@property (weak) IBOutlet NSTextField *txtYear;

@property (weak) IBOutlet NSTextField *txtHour;

@property (weak) IBOutlet NSTextField *txtMinute;

@property (weak) IBOutlet NSTextView *txtDescription;

@property (strong, nonatomic) NSDate *selectedDate;

@property (strong, nonatomic) NSMutableDictionary *appointments;

- (IBAction)adjustDateButtons_Click:(id)sender;

- (IBAction)showButton_Click:(id)sender;

- (IBAction)createButton_Click:(id)sender;

- (IBAction)cancelButton_Click:(id)sender;

@end
