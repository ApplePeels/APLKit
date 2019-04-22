//
//  UIImage+APLClip.h
//  APLKit
//
//  Created by wangxingming on 2019/4/22.
//  Copyright © 2019 AiJia. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (APLClip)

- (UIImage*)apl_clipToSize:(CGSize)size;

- (UIImage*)apl_masksToBounds:(CGFloat)cornerRaduis;


@end

NS_ASSUME_NONNULL_END
