//
//  MapPin.h
//  ClassAssignment1
//
//  Created by Ameya Shetye on 2/1/15.
//  Copyright (c) 2015 SMU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "TableViewControllerMap.h"
@interface MapPin : NSObject <MKAnnotation>
{ CLLocationCoordinate2D coordinate;
    NSString *title;
    NSString *subtitle;
}
@property (nonatomic,assign)CLLocationCoordinate2D coordinate;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *subtitle;

@end
