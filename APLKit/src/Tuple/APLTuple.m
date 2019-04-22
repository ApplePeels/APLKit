//
//  APLTuple.m
//  APLKit
//
//  Created by ApplePeel on 2019/4/22.
//  Copyright © 2019 ApplePeel. All rights reserved.
//

#import "APLTuple.h"

@interface APLTuple ()
@property (nonatomic, strong) NSArray* tupleDataSource;
@end

@implementation APLTuple

+ (instancetype)tupleWithArray:(NSArray*)tupleArray {
    APLTuple* tuple = [[APLTuple alloc] init];
    tuple.tupleDataSource = tupleArray;
    return tuple;
}

- (id)first {
    return [self __getDataSouce:0];
}

- (id)second {
    return [self __getDataSouce:1];
}

- (id)third {
    return [self __getDataSouce:2];
}

- (id)fourth {
    return [self __getDataSouce:3];
}

- (id)__getDataSouce:(NSInteger)index {
    if (self.tupleDataSource.count <= index) {
        return nil;
    }
    return self.tupleDataSource[index];
}

@end
