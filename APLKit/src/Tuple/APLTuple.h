//
//  APLTuple.h
//  APLKit
//
//  Created by ApplePeel on 2019/4/22.
//  Copyright © 2019 ApplePeel. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface APLTuple : NSObject

+ (instancetype)tuple;
+ (instancetype)tupleWithArray:(NSArray*)tupleArray;

- (APLTuple*)addObj:(id)object;

@property (nonatomic, strong, readonly) id first;
@property (nonatomic, strong, readonly) id second;
@property (nonatomic, strong, readonly) id third;
@property (nonatomic, strong, readonly) id fourth;

@end

NS_ASSUME_NONNULL_END
