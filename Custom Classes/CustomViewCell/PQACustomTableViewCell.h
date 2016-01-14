//
//  PQACustomTableViewCell.h
//  pricanQAbyGMO-ObjC
//
//  Created by DEV-MinhNN on 1/14/16.
//  Copyright © 2016 DEV-MinhNN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PQAConsultation.h"
#import "PQACards.h"
#import "PQACardHouseAd.h"

@interface PQACustomTableViewCell : UITableViewCell <UIActionSheetDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *avatar;
@property (weak, nonatomic) IBOutlet UILabel *fullName;
@property (weak, nonatomic) IBOutlet UILabel *Userdescription;

@property (weak, nonatomic) IBOutlet UILabel *numberLike;
@property (weak, nonatomic) IBOutlet UILabel *numberComment;
@property (weak, nonatomic) IBOutlet UILabel *numberWatch;

@property (weak, nonatomic) IBOutlet UIView *viewContaint;
@property (weak, nonatomic) IBOutlet UILabel *labelAge;

@property (nonatomic, strong) PQACardHouseAd *house_ad;

- (void)fillDataToCell:(PQACards *)consulation;

@end
