//
//  ViewControllerTimer.h
//  ClassAssignment1
//
//  Created by smumac1 on 2/4/15.
//  Copyright (c) 2015 SMU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerTimer : UIViewController<UIAlertViewDelegate>
@property (weak,nonatomic)  NSNumber *count;

@property(strong,nonatomic) NSNumber *seconds;
@property(strong,nonatomic) NSTimer *timer;
@end
