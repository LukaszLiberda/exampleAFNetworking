//
//  EXNetworkManager.h
//  exampleAFNetworking
//
//  Created by lukasz liberda on 3/10/14.
//  Copyright (c) 2014 example. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface EXNetworkManager : NSObject

typedef void (^EXNetworkCompletionBlock)(NSDictionary *elementRequest);
typedef void (^EXNetworkErrorBlock)(NSError *error);

+ (instancetype)sharedManager;

- (void)testBlock:(EXNetworkCompletionBlock)onCompletion errorBlock:(EXNetworkErrorBlock)onError;
@end
