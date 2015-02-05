//
//  ImageModel.h
//  ClassAssignment1
//
//  Created by smumac1 on 2/1/15.
//  Copyright (c) 2015 SMU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ImageModel : NSObject

@property (strong,nonatomic) NSArray* imageNames;

+(ImageModel*) sharedInstance;
-(UIImage*) getImageWithName:(NSString*) name;

@end
