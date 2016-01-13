//
//  MFResponse.m
//  pricanQAbyGMO-ObjC
//
//  Created by DEV-MinhNN on 1/13/16.
//  Copyright © 2016 DEV-MinhNN. All rights reserved.
//

#import "MFResponse.h"

@implementation MFResponse

+ (MFResponse *)responseObjectWithRequestOperation:(AFHTTPRequestOperation *)operation
                                              error:(NSError *)error {
    NSString *responseString = [[NSString alloc] initWithData:operation.responseData encoding:NSUTF8StringEncoding];
    DLog(@"Server response string: %@", responseString);
    DLog(@"Server response status code %d %@", (int)operation.response.statusCode, error.localizedDescription);
    
    NSError *parserError = nil;
    MFResponse *obj = [[MFResponse alloc] initWithData:operation.responseData error:&parserError];
    return obj;
}

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

@end
