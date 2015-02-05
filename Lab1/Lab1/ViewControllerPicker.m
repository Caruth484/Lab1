//
//  ViewControllerPicker.m
//  ClassAssignment1
//
//  Created by smumac1 on 2/4/15.
//  Copyright (c) 2015 SMU. All rights reserved.
//

#import "ViewControllerPicker.h"

@interface ViewControllerPicker ()
@property (weak, nonatomic) IBOutlet UITextField *myTextField;
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property(strong,nonatomic) NSArray *pickerArray;

@end

@implementation ViewControllerPicker

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _pickerArray = @[@"Item 1", @"Item 2", @"Item 3", @"Item 4", @"Item 5", @"Item 6"];
    self.picker.dataSource=self;
    self.picker.delegate=self;
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(int) numberofComponents:(UIPickerView*) pickerView{
    return 1;
}
-(int)pickerView:(UIPickerView*) pickerView numberOfRowsInComponent:(NSInteger)component{
    return _pickerArray.count;
}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _pickerArray[row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
