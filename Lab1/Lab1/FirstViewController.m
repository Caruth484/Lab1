//
//  FirstViewController.m
//  ClassAssignment1
//
//  Created by Ameya Shetye on 2/1/15.
//  Copyright (c) 2015 SMU. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "AppDelegate.h"
@interface FirstViewController()
@end
@implementation FirstViewController

/*- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
 {
 self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
 if (self) {
 // Custom initialization
 }
 return self;
 }*/

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    Picker=[[NSArray alloc] initWithObjects: @"Technology",@"grocery",@"Other", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [Picker count];
}

- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return (NSString*) [Picker objectAtIndex: row];
}

- (IBAction)ADD{
    if([ItemName.text isEqual:@""]||[Cost.text isEqual:@""]) {
        UIAlertView *alert= [[UIAlertView alloc]initWithTitle:@"Alert"  message:@"The entered Item name or Cost is invalid"
                             
                                                     delegate:self
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
        
        [alert show];
    }/* else {
      SecondView= [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
      //[self presentModalViewController:self->SecondView animated:YES];
      SecondView->Itemname.text=[ItemName text];
      SecondView->Cost.text=[Cost text];
      NSInteger row = [pickerView selectedRowInComponent:0];
      
      SecondView->SDomain.text=[Picker objectAtIndex:row];
      }*/
    
    
    // if (([ItemName.text length]==0)||([Cost.text length] ==0)|| ([Cost.text doubleValue]==0.0))
    
    // { return;}
    
    else
    { int databaserecord;
        FirstViewController *firstViewController= [[FirstViewController alloc]init ];
        const char* dbFilepathUTF8 =[firstViewController.dbFilePath UTF8String];
        databaserecord = sqlite3_open(dbFilepathUTF8, &DataBase);
        
        if (databaserecord)
        {
            NSLog(@"couldn't open database:");
            return;
        }
        
        sqlite3_stmt *dbps;
        NSString *insertStatementNS= [NSString stringWithFormat:@"insert into\"shoppinglist\"\
                                      (item ,price, groupid, dateadded)\
                                      values(\"%@\", %@, %ld, DATETIME('NOW'))",
                                      ItemName.text,
                                      Cost.text,
                                      (long)[pickerView selectedRowInComponent:0]];
        
        const char *insertStatement =[insertStatementNS UTF8String];
        databaserecord = sqlite3_prepare_v2 (DataBase, insertStatement, -1, &dbps, NULL);
        databaserecord = sqlite3_step(dbps);
        sqlite3_finalize(dbps);
        sqlite3_close(DataBase);
    }
}

- (IBAction)RESET{
    ItemName.text = @"";
    Cost.text = @"";
    [pickerView selectRow:0 inComponent:0 animated:YES];
    [ItemName resignFirstResponder];
    [Cost resignFirstResponder];
}


-(NSString *) dbFilePath
{
    NSArray *searchPaths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    NSString *documentFolderPath =[searchPaths objectAtIndex:0];
    return [documentFolderPath stringByAppendingString:(__bridge NSString *)(DataBase)];
}




-(BOOL) findDatebase
{
    if (![[NSFileManager defaultManager] fileExistsAtPath:self.dbFilePath])
    {
        NSString *backupDbPath = [[NSBundle mainBundle]
                                  pathForResource:DataBase_NAME
                                  ofType:DataBase_TYPE];
        
        if (backupDbPath == nil)
        {
            return NO;
        }
        
        else
        {
            BOOL copiedBackupDb = [[NSFileManager defaultManager]
                                   copyItemAtPath:backupDbPath
                                   toPath:self.dbFilePath
                                   error:nil];
            if (! copiedBackupDb)
            {
                // copying backup db failed, bail
                return NO;
            }
        }
    }
    
    return YES;
}




-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}






@end
