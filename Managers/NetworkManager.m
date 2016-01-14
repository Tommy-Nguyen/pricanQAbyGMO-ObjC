//
//  NetworkManager.m
//  pricanQAbyGMO-ObjC
//
//  Created by DEV-MinhNN on 1/13/16.
//  Copyright © 2016 DEV-MinhNN. All rights reserved.
//

#import "NetworkManager.h"

#define MOBILE_BASE_URL_DE  [[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Configuration" ofType:@"plist"]][@"MobileBaseUrl"]

#define kNetWorkTimeOutInterval  30

@implementation NetworkManager

+ (NetworkManager *)sharedManager {
    static NetworkManager *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[NetworkManager alloc] initWithBaseURL:[NSURL URLWithString:self.baseURL]];
    });
    
    return _sharedClient;
}

+ (NSString *)baseURL {
    return MOBILE_BASE_URL_DE;
}

- (instancetype)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (self) {
        self.operationQueue.maxConcurrentOperationCount = 5;
        self.requestSerializer = [AFHTTPRequestSerializer serializer];
        self.responseSerializer = [AFHTTPResponseSerializer serializer];
    }
    return self;
}

#pragma mark - Client helper methods

- (void)callWebserviceWithPath:(NSString *)path
                        method:(NSString *)method
                    parameters:(NSDictionary *)parameters
                    completion:(void (^) (MFResponse *responseObject))completion {
    DLog(@"%@", self.requestSerializer.HTTPRequestHeaders);
    NSMutableURLRequest *request = [self requestWithMethod:method parameters:parameters path:path];
    
    if (request) {
        [request setTimeoutInterval:kNetWorkTimeOutInterval];
        AFHTTPRequestOperation *operation = [self operationForRequest:request completion:completion];
        if (operation != nil) {
            [[NetworkManager sharedManager].operationQueue addOperation:operation];
        }
    }
}

- (NSDictionary *)fullAPIParameters:(NSDictionary *)parameters {
    NSMutableDictionary *mParams = parameters ? parameters.mutableCopy : @{}.mutableCopy;
    return mParams;
}

/**
 Create request for special method, parameters and path
 @param method The HTTP method for the request
 @param parameters The parameters that will be include to the request
 @param path The url for the request
 */

- (NSMutableURLRequest *)requestWithMethod:(NSString *)method
                                parameters:(NSDictionary *)parameters
                                      path:(NSString *)path {
    NSError *error;
    NSMutableURLRequest *request = [self.requestSerializer requestWithMethod:method
                                                                   URLString:[[NSURL URLWithString:path relativeToURL:self.baseURL] absoluteString]
                                                                  parameters:parameters
                                                                       error:&error];
    
    if (error) {
        DLog(@"Unresolve error: %@", error.userInfo);
        abort();
    }
    
    DLog(@"----------------------");
    DLog(@"Path:%@ \n Body params: %@ \n", path, [self fullAPIParameters:parameters]);
    DLog(@"----------------------");
    [request setTimeoutInterval:kNetWorkTimeOutInterval];
    return request;
}

/**
 
 */
- (AFHTTPRequestOperation *)operationForRequest:(NSMutableURLRequest *)request completion:(void (^) (MFResponse *responseObject))completion {
    if (request == nil) {
        DLog(@"Request cannot be nil @@!");
        abort();
    }
    return [self HTTPRequestOperationWithRequest:request success: ^(AFHTTPRequestOperation *operation, id responseObject) {
        MFResponse *responseObj = [MFResponse responseObjectWithRequestOperation:operation error:nil];
        if (completion) {
            completion(responseObj);
        }
    } failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
        MFResponse *responseObj = [MFResponse responseObjectWithRequestOperation:operation error:error];
        if (completion) {
            completion(responseObj);
        }
    }];
}

#pragma mark - Api Method

- (void)getListDataFromServerAndCompletion:(void (^) (NSMutableArray *consultations))completion {
    [self callWebserviceWithPath:@"" method:@"GET" parameters:nil completion:^(MFResponse *responseObject) {
        NSMutableArray *result = [NSMutableArray new];
        for (NSDictionary *dict in responseObject.cards) {
            [result addObject:dict];
        }
        if (completion) {
            completion(result);
        }
    }];
}

@end
