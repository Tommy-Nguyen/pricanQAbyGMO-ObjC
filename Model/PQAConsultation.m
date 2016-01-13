//
//  PQAConsultation.m
//  pricanQAbyGMO-ObjC
//
//  Created by DEV-MinhNN on 1/13/16.
//  Copyright © 2016 DEV-MinhNN. All rights reserved.
//

#import "PQAConsultation.h"

@implementation PQAConsultation

+(JSONKeyMapper*)keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"is_watch"  : @"is_watch",
                                                       @"created_at": @"created_at",
                                                       @"user_id"   : @"user_id",
                                                       
                                                       @"is_like"        : @"is_like",
                                                       @"consultation_id": @"consultation_id",
                                                       @"is_commented"   : @"is_commented",
                                                       
                                                       @"is_liked"       : @"is_liked",
                                                       @"new_flag"       : @"objNewFlag",
                                                       @"comment_count"  : @"comment_count",
                                                       
                                                       @"like_count"       : @"like_count",
                                                       @"categories"       : @"categories",
                                                       @"has_best_answer"  : @"has_best_answer",
                                                       
                                                       @"is_watched"       : @"is_watched",
                                                       @"watch_count"      : @"watch_count",
                                                       @"anonymous_no"     : @"anonymousNo",
                                                       @"nickname"         : @"nickname",
                                                       
                                                       @"age"               : @"age",
                                                       @"is_official_user"  : @"is_official_user",
                                                       @"description"       : @"description",
                                                       
                                                       @"consultation.thumbnail_urls.default" : @"ThumDefault",
                                                       @"consultation.thumbnail_urls.grayed"  : @"ThumGrayed"
                                                       }];
}

@end
