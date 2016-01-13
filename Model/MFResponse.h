//
//  MFResponse.h
//  pricanQAbyGMO-ObjC
//
//  Created by DEV-MinhNN on 1/13/16.
//  Copyright © 2016 DEV-MinhNN. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface MFResponse : JSONModel

@property (nonatomic, strong) NSDictionary *cards;
@property (nonatomic, strong) NSString *last_id;

+ (MFResponse *)responseObjectWithRequestOperation:(AFHTTPRequestOperation *)operation
                                              error:(NSError *)error;
@end
