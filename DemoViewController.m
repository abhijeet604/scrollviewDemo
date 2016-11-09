//
//  DemoViewController.m
//  scrollviewDemo
//
//  Created by iBoss on 12/02/16.
//  Copyright © 2016 iBoss. All rights reserved.
//

#import "DemoViewController.h"


@interface DemoViewController ()

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIRotationGestureRecognizer *rotationGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotateImage:)];
    [self.view addGestureRecognizer:rotationGesture];
    
    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(scaleImage:)];
    [self.view addGestureRecognizer:pinchGesture];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resetImage:)];
    [self.view addGestureRecognizer:tapGesture];
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveImage:)];
    [panGesture setMinimumNumberOfTouches:1];
    [panGesture setMaximumNumberOfTouches:1];
    [self.view addGestureRecognizer:panGesture];
    
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
- (void)rotateImage:(UIRotationGestureRecognizer *)recognizer
{
    
    if([recognizer state] == UIGestureRecognizerStateEnded) {
        
        previousRotation = 0.0;
        return;
    }
    
    CGFloat newRotation = 0.0 - (previousRotation - [recognizer rotation]);
    
    CGAffineTransform currentTransformation = self.imageview.transform;
    CGAffineTransform newTransform = CGAffineTransformRotate(currentTransformation, newRotation);
    
    self.imageview.transform = newTransform;
    
    previousRotation = [recognizer rotation];
}

- (void)scaleImage:(UIPinchGestureRecognizer *)recognizer
{
    
    if([recognizer state] == UIGestureRecognizerStateEnded) {
        
        previousScale = 1.0;
        return;
    }
    
    CGFloat newScale = 1.0 - (previousScale - [recognizer scale]);
    
    CGAffineTransform currentTransformation = self.imageview.transform;
    CGAffineTransform newTransform = CGAffineTransformScale(currentTransformation, newScale, newScale);
    
    self.imageview.transform = newTransform;
    
    previousScale = [recognizer scale];
}

- (void)resetImage:(UITapGestureRecognizer *)recognizer
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    
    self.imageview.transform = CGAffineTransformIdentity;
    
    [self.imageview setCenter:CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2)];
    
    [UIView commitAnimations];
}

- (void)moveImage:(UIPanGestureRecognizer *)recognizer
{
    CGPoint newCenter = [recognizer translationInView:self.view];
    
    if([recognizer state] == UIGestureRecognizerStateBegan) {
        
        beginX = self.imageview.center.x;
        beginY = self.imageview.center.y;
    }
    
    newCenter = CGPointMake(beginX + newCenter.x, beginY + newCenter.y);
    
    [self.imageview setCenter:newCenter];
    
}



@end
