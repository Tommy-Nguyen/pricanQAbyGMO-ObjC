//
//  PQACards.h
//  pricanQAbyGMO-ObjC
//
//  Created by DEV-MinhNN on 1/13/16.
//  Copyright © 2016 DEV-MinhNN. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "PQAConsultation.h"

@protocol PQACards
@end

@interface PQACards : JSONModel

@property (nonatomic, strong) PQAConsultation *consultation;

@end
