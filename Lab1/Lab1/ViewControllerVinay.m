//
//  ViewController.m
//  ClassAssignment1
//
//  Created by Ameya Shetye on 2/1/15.
//  Copyright (c) 2015 SMU. All rights reserved.
//

#import "ViewControllerVinay.h"
#import "ImageModel.h"

@interface ViewControllerVinay () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *textChangeButton;

@property (strong,nonatomic) UIImageView* imageView;
@property(strong,nonatomic) ImageModel* myImageModel;

@end

@implementation ViewControllerVinay

-(ImageModel*)myImageModel{
    if(!_myImageModel)
        _myImageModel=[ImageModel sharedInstance];
    return _myImageModel;
    
}

-(NSString*) imageName{
    if(!_imageName)
        _imageName=@"Vinay1";
    return _imageName;
}
-(UIImageView*)imageView{
    if(!_imageView)
        _imageView=[[UIImageView alloc] initWithImage:[[ImageModel sharedInstance] getImageWithName:self.imageName]];
    
    return _imageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.scrollView addSubview:self.imageView];
    self.scrollView.contentSize=self.imageView.image.size;
    self.scrollView.minimumZoomScale=0.1;
    self.scrollView.delegate=self;
   
    
}

-(UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.imageView;
}





- (IBAction)buttonClick:(id)sender {
}
@end
