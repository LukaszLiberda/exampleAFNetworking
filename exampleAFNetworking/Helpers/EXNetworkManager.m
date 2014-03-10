//
//  EXNetworkManager.m
//  exampleAFNetworking
//
//  Created by lukasz liberda on 3/10/14.
//  Copyright (c) 2014 example. All rights reserved.
//

#import "EXNetworkManager.h"

@interface EXNetworkManager ()
@property (nonatomic, strong) AFHTTPRequestOperationManager *requestOperationManager;

@end

@implementation EXNetworkManager

+ (instancetype)sharedManager {
    static EXNetworkManager *object = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        object = [[EXNetworkManager alloc] init];
    });
    return object;
}

- (id)init {
    self = [super init];
    
    if (self) {
        self.requestOperationManager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:@"string url"]];
        [self.requestOperationManager setRequestSerializer:[AFJSONRequestSerializer serializer]];
        self.requestOperationManager.responseSerializer = [AFJSONResponseSerializer serializer];
        [self.requestOperationManager.requestSerializer setValue:@"application/json, version=1"  forHTTPHeaderField:@"Accept"];
        [self.requestOperationManager.requestSerializer setAuthorizationHeaderFieldWithUsername:@"user" password:@"password"];
        [self.requestOperationManager.operationQueue setMaxConcurrentOperationCount:24];
    }
    return self;
}

#pragma mark - private base network method

- (void)POST:(NSString *)urlString parameters:(NSDictionary *)parameters success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure {
    [self.requestOperationManager POST:urlString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(operation, responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(operation, error);
    }];
}

- (void)GET:(NSString *)urlString parameters:(NSDictionary *)parameters success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure {
    [self.requestOperationManager GET:urlString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(operation, responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(operation, error);
    }];
}

- (void)PUT:(NSString *)urlString parameters:(NSDictionary *)parameters success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure {
    [self.requestOperationManager PUT:urlString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(operation, responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(operation, error);
    }];
}

- (void)DELETE:(NSString *)urlString parameters:(NSDictionary *)parameters success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure {
    [self.requestOperationManager DELETE:urlString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(operation, responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(operation, error);
    }];
}

#pragma mark - 

- (void)testBlock:(EXNetworkCompletionBlock)onCompletion errorBlock:(EXNetworkErrorBlock)onError {
    [self POST:@"example" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        onCompletion(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        onError(error);
    }];
}

@end
