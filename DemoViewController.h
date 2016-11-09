//
//  DemoViewController.h
//  scrollviewDemo
//
//  Created by iBoss on 12/02/16.
//  Copyright © 2016 iBoss. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DemoViewController : UIViewController
{
    NSString *productName;
    
    CGFloat previousScale;
    CGFloat previousRotation;
    
    CGFloat beginX;
    CGFloat beginY;
}
@property (weak, nonatomic) IBOutlet UIView *enlargeView;
@property (weak, nonatomic) IBOutlet UIImageView *imageview;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
- (void)centerScrollViewContents;
@end
