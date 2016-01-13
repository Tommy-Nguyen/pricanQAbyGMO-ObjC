//
//  PQAHouseAd.h
//  pricanQAbyGMO-ObjC
//
//  Created by DEV-MinhNN on 1/13/16.
//  Copyright © 2016 DEV-MinhNN. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol PQAHouseAd
@end

@interface PQAHouseAd : JSONModel

@property (nonatomic, strong) NSString *action;
@property (nonatomic, strong) NSString *img_url;

@end
