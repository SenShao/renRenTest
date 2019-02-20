//
//  UIView+kkkkkk.m
//  FBSnapshotTestCase
//
//  Created by 耿森森 on 2019/2/19.
//

#import "UIView+kkkkkk.h"

@implementation UIView (kkkkkk)

+(UIImage *)getImageWithName:(NSString *)name{
    
    NSString *imgBundlePath = [[NSBundle mainBundle] pathForResource:@"renRenTest" ofType:@"bundle"];
    NSBundle *imgBundle = [NSBundle bundleWithPath:imgBundlePath];
    UIImage *image = [UIImage imageNamed:name inBundle:imgBundle compatibleWithTraitCollection:nil];
    
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
}

@end
