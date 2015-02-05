//
//  ViewControllerTimer.m
//  ClassAssignment1
//
//  Created by smumac1 on 2/4/15.
//  Copyright (c) 2015 SMU. All rights reserved.
//

#import "ViewControllerTimer.h"
#import "TableViewControllerVinay.h"
@interface ViewControllerTimer ()
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end

@implementation ViewControllerTimer
@synthesize count = _count;
@synthesize scoreLabel=_scoreLabel;
@synthesize seconds=_seconds;
@synthesize timer=_timer;
- (IBAction)buttonPressed:(id)sender {
    self.count = @(self.count.intValue+1);
    
    _scoreLabel.text=[NSString stringWithFormat:@"Score %@",self.count];

   
}
-(void) setupGame{
    //static int count =0;

    
    NSLog(@"score is %@",self.count);
       // _timeLabel.text=[NSString stringWithFormat:@"Time: %i",seconds];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                              target:self
                                                selector:@selector(subtractTime:)
                                            userInfo:nil
                                             repeats:YES];
    
}
-(void) subtractTime{
        int seconds = 10;
   _seconds=@(self.seconds.integerValue-1);
    
   _timeLabel.text = [NSString stringWithFormat:@"Time:%@",self.seconds];
  
    if (self.seconds == 0) {
        [_timer invalidate];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Time is up!"
                                                    message:[NSString stringWithFormat:@"You scored %@ points", _count]
                                                   delegate:self
                                          cancelButtonTitle:@"Play Again"
                                          otherButtonTitles:nil];
    
        [alert show];}
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupGame];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    [self setupGame];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
