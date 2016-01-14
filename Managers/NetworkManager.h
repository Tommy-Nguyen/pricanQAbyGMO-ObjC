//
//  NetworkManager.h
//  pricanQAbyGMO-ObjC
//
//  Created by DEV-MinhNN on 1/13/16.
//  Copyright © 2016 DEV-MinhNN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MFResponse.h"
#import "PQAConsultation.h"
#import "PQACards.h"

@interface NetworkManager : AFHTTPRequestOperationManager

+ (NetworkManager *)sharedManager;

- (void)getListDataFromServerAndCompletion:(void (^) (NSMutableArray *consultations))completion;

@end
