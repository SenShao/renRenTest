//
//  UIImage+Add.m
//  Gravity
//
//  Created by Ming on 2018/9/4.
//  Copyright © 2018 DoNews. All rights reserved.
//

#import "UIImage+Add.h"

@implementation UIImage (Add)


+ (instancetype)ca_imageName:(NSString *)imageName inBundle:(NSString *)bundle {
    NSString *imgBundlePath = [[NSBundle mainBundle] pathForResource:bundle ofType:@"bundle"];
    NSBundle *imgBundle = [NSBundle bundleWithPath:imgBundlePath];
    UIImage *image = [UIImage imageNamed:imageName inBundle:imgBundle compatibleWithTraitCollection:nil];
    
    NSLog(@"=====%f",[UIView new].left);
    
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
}

+ (instancetype)ca_imageClip:(UIImage *)image {
    CGSize newSize;
    CGImageRef imageRef =nil;
    
    if ((image.size.width / image.size.height) < 1) {
        
        newSize.width = image.size.width;
        newSize.height = image.size.width ;
        
        imageRef = CGImageCreateWithImageInRect([image CGImage], CGRectMake(0,fabs(image.size.height - newSize.height) / 2, newSize.width, newSize.height));
        
    } else {
        
        newSize.height = image.size.height;
        newSize.width = image.size.height * 1;
        
        imageRef = CGImageCreateWithImageInRect([image CGImage], CGRectMake(fabs(image.size.width - newSize.width) / 2, 0, newSize.width, newSize.height));
    }
    
    
    return [UIImage imageWithCGImage:imageRef];
    
}

+ (instancetype)ca_imageWithColor:(UIColor *)color {
    
    CGRect rect = CGRectMake(0.0f,0.0f,1.0f,1.0f);UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

//返回特定尺寸的UImage  ,  image参数为原图片，size为要设定的图片大小
+ (UIImage*)ca_resizeImageToSize:(CGSize)size sizeOfImage:(UIImage*)image {
    UIGraphicsBeginImageContext(size);
    //获取上下文内容
    CGContextRef ctx= UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(ctx, 0.0, size.height);
    CGContextScaleCTM(ctx, 1.0, -1.0);
    //重绘image
    CGContextDrawImage(ctx,CGRectMake(0.0f, 0.0f, size.width, size.height), image.CGImage);
    //根据指定的size大小得到新的image
    UIImage* scaled= UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaled;
}


@end
