//
//  PQAConsultation.m
//  pricanQAbyGMO-ObjC
//
//  Created by DEV-MinhNN on 1/13/16.
//  Copyright © 2016 DEV-MinhNN. All rights reserved.
//

#import "PQAConsultation.h"

@implementation PQAConsultation

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

+ (JSONKeyMapper*)keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"is_watch"          : @"is_watch",
                                                       @"created_at"        : @"created_at",
                                                       @"user_id"           : @"user_id",
                                                       @"is_like"           : @"is_like",
                                                       @"consultation_id"   : @"consultation_id",
                                                       
                                                       @"is_commented"      : @"is_commented",
                                                       @"is_liked"          : @"is_liked",
                                                       @"comment_count"     : @"comment_count",
                                                       
                                                       @"like_count"        : @"like_count",
                                                       @"categories"        : @"categories",
                                                       @"has_best_answer"   : @"has_best_answer",
                                                       @"is_watched"        : @"is_watched",
                                                       @"nickname"          : @"nickname",

                                                       @"watch_count"       : @"watch_count",
                                                       @"age"               : @"age",
                                                       @"is_official_user"  : @"is_official_user",
                                                       
                                                       @"new_flag"          : @"objNewFlag",
                                                       @"anonymous_no"      : @"anonymousNo",
                                                       @"description"       : @"objDes",
                                                       @"thumbnail_urls"    : @"thumbnail_urls",
                                                       
                                                       }];
}

@end
