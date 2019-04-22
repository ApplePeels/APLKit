//
//  UIImage+APLClip.m
//  APLKit
//
//  Created by wangxingming on 2019/4/22.
//  Copyright © 2019 AiJia. All rights reserved.
//

#import "UIImage+APLClip.h"

@implementation UIImage (APLClip)

- (UIImage*)apl_clipToSize:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, NO, [[UIScreen mainScreen] scale]);
    // 绘制改变大小的图片
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage * scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    return scaledImage;
}

- (UIImage*)apl_masksToBounds:(CGFloat)cornerRaduis {
    CGSize imageSize = self.size;
    CGRect imageBounds = CGRectMake(0, 0, imageSize.width, imageSize.height);
    UIGraphicsBeginImageContext(imageSize);
    UIBezierPath* bezierPath = [UIBezierPath bezierPathWithRoundedRect:imageBounds cornerRadius:cornerRaduis];
    [bezierPath addClip];
    [self drawInRect:imageBounds];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


@end
