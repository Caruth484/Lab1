//
//  TableViewControllerVinay.m
//  ClassAssignment1
//
//  Created by smumac1 on 2/1/15.
//  Copyright (c) 2015 SMU. All rights reserved.
//

#import "TableViewControllerVinay.h"
#import "ViewControllerVinay.h"
#import "ImageModel.h"
#import "ViewControllerTimer.h"
@interface TableViewControllerVinay ()
@property(strong,nonatomic) ImageModel* myImageModel;
@end

@implementation TableViewControllerVinay
-(ImageModel*)myImageModel{
    if(!_myImageModel)
        _myImageModel=[ImageModel sharedInstance];
    return _myImageModel;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}





- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    
        return 1;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell =nil;
    if(indexPath.section==0){
    cell=[tableView dequeueReusableCellWithIdentifier:@"ImageNameCell" forIndexPath:indexPath];
    
    // Configure the cell...
   
    
    // Configure the cell...
    cell.textLabel.text=self.myImageModel.imageNames[indexPath.row];
        cell.detailTextLabel.text=@"More";}
    if(indexPath.section==1){
        cell=[tableView dequeueReusableCellWithIdentifier:@"sliderCell" forIndexPath:indexPath];
        
        // Configure the cell...
        
        
        // Configure the cell...
        cell.textLabel.text=@"Slider";
        cell.detailTextLabel.text=@"More";}
    if(indexPath.section==2){
        cell=[tableView dequeueReusableCellWithIdentifier:@"timerCell" forIndexPath:indexPath];
        
        // Configure the cell...
        
        
        // Configure the cell...
        cell.textLabel.text=@"Timer Cell";
        cell.detailTextLabel.text=@"More";}
    if(indexPath.section==3){
        cell=[tableView dequeueReusableCellWithIdentifier:@"collectionCell" forIndexPath:indexPath];
        
        // Configure the cell...
        
        
        // Configure the cell...
        cell.textLabel.text=@"Collection Cell";
        cell.detailTextLabel.text=@"More";}
    if(indexPath.section==4){
        cell=[tableView dequeueReusableCellWithIdentifier:@"pickerCell" forIndexPath:indexPath];
        
        // Configure the cell...
        
        
        // Configure the cell...
        cell.textLabel.text=@"Picker Cell";
        cell.detailTextLabel.text=@"More";}

    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    BOOL isVC =[[segue destinationViewController] isKindOfClass:[ViewControllerVinay class]];
    if(isVC)
        
    {
        UITableViewCell* cell=(UITableViewCell*)sender;
        ViewControllerVinay *vc = [segue destinationViewController];
        vc.imageName = cell.textLabel.text;
    }
    BOOL isVC1 =[[segue destinationViewController] isKindOfClass:[ViewControllerTimer class]];
    if(isVC1)
        
    {
        UITableViewCell* cell=(UITableViewCell*)sender;
        ViewControllerTimer *vc1 = [segue destinationViewController];
        vc1.count = 0;
        
    }
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
