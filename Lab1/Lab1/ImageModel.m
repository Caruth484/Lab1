//
//  ImageModel.m
//  ClassAssignment1
//
//  Created by smumac1 on 2/1/15.
//  Copyright (c) 2015 SMU. All rights reserved.
//

#import "ImageModel.h"
#import <UIKit/UIKit.h>
@implementation ImageModel
@synthesize imageNames = _imageNames;
-(NSArray*) imageNames{
    if(!_imageNames)
        _imageNames=@[@"Vinay1",@"Vinay2",@"Vinay3"];
    return _imageNames;
}

+(ImageModel*)sharedInstance{
    static ImageModel * _sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate,^{_sharedInstance=[[ImageModel alloc] init];
    });
    return _sharedInstance;
}
-(UIImage*)getImageWithName:(NSString *)name{
    UIImage* image = nil;
    image = [UIImage imageNamed:name];
    return image;
}

@end
