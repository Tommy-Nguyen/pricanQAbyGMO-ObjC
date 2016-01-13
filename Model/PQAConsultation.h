//
//  PQAConsultation.h
//  pricanQAbyGMO-ObjC
//
//  Created by DEV-MinhNN on 1/13/16.
//  Copyright © 2016 DEV-MinhNN. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol ProductModel
@end

@interface ProductModel : JSONModel

@property (strong, nonatomic) NSString *defaultF;
@property (assign, nonatomic) NSString *grayed;

@end

@protocol PQAConsultation
@end

@interface PQAConsultation : JSONModel

@property (nonatomic, strong) NSString *is_watch;
@property (nonatomic, strong) NSString *created_at;
@property (nonatomic, strong) NSString *user_id;
@property (nonatomic, strong) NSString *is_like;
@property (nonatomic, strong) NSString *consultation_id;

@property (nonatomic, strong) NSString *is_commented;
@property (nonatomic, strong) NSString *is_liked;
@property (nonatomic, strong) NSString *objNewFlag;
@property (nonatomic, strong) NSString *comment_count;

@property (nonatomic, strong) NSString *like_count;
@property (nonatomic, strong) NSArray<Optional> *categories;
@property (nonatomic, strong) NSString *has_best_answer;
@property (nonatomic, strong) NSString *is_watched;

@property (nonatomic, strong) NSString *watch_count;
@property (nonatomic, strong) NSString *anonymousNo;
@property (nonatomic, strong) NSString *age;
@property (nonatomic, strong) NSString *is_official_user;
@property (nonatomic, strong) NSString *objDescription;

@property (nonatomic, strong) NSArray<ProductModel> *thumbnail_urls;

@end
