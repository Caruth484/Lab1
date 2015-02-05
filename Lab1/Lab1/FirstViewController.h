//
//  FirstViewController.h
//  ClassAssignment1
//
//  Created by Ameya Shetye on 2/1/15.
//  Copyright (c) 2015 SMU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondViewController.h"
#import <sqlite3.h>
#import "AppDelegate.h"
@interface FirstViewController : UIViewController <UIAlertViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate >
{
    IBOutlet UITextField *ItemName;
    IBOutlet UITextField *Cost;
    IBOutlet UIButton *ADD;
    IBOutlet UIButton *RESET;
    IBOutlet UIPickerView *pickerView;
    NSArray *Picker;
    SecondViewController *SecondView;
    sqlite3 *DataBase;
    NSArray* groupOptions;
    
    
}

- (IBAction)ADD;
- (IBAction)RESET;
- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView;
-(NSString *) dbFilePath;
-(BOOL) findDatebase;
-(BOOL) textFieldShouldReturn:(UITextField *)textField;

@end
