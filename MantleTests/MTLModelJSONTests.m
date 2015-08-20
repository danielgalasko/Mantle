//
//  MTLModelJSONTests.m
//  Mantle
//
//  Created by Daniel Galasko on 2015/08/20.
//  Copyright (c) 2015 GitHub. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <Mantle/Mantle.h>

@interface MTLJSONTestModel : MTLModel<MTLJSONSerializing>
@property (nonatomic, copy, readonly) NSString *property;
@end

@implementation MTLJSONTestModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{NSStringFromSelector(@selector(property)) : @"jsonkey"};
}

@end
@interface MTLModelJSONTests : XCTestCase

@end

@implementation MTLModelJSONTests

- (void)testInitializingWithNilJSONReturnsNil {
	NSError *error;
	MTLJSONTestModel *mod = [MTLJSONAdapter modelOfClass:[MTLJSONTestModel class] fromJSONDictionary:nil error:&error];
	XCTAssertNil(error);
	XCTAssertNil(mod);
}

@end
