//
//  PQADetailViewController.h
//  pricanQAbyGMO-ObjC
//
//  Created by DEV-MinhNN on 1/14/16.
//  Copyright © 2016 DEV-MinhNN. All rights reserved.
//

#import "PQABaseViewController.h"
#import "PQACards.h"

@interface PQADetailViewController : PQABaseViewController

@property (nonatomic, strong) PQACards *currentCard;
@property (weak, nonatomic) IBOutlet UIScrollView *scroolView;

@property (weak, nonatomic) IBOutlet UIImageView *avatar;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *label2;

@property (weak, nonatomic) IBOutlet UITextView *txtDescription;

@property (weak, nonatomic) IBOutlet UILabel *numberLike;
@property (weak, nonatomic) IBOutlet UILabel *numberWatch;
@property (weak, nonatomic) IBOutlet UILabel *numberComment;

@property (weak, nonatomic) IBOutlet UIView *viewContant;

@property (weak, nonatomic) IBOutlet UIView *viewLike;
@property (weak, nonatomic) IBOutlet UIView *viewComment;
@property (weak, nonatomic) IBOutlet UIView *viewWatch;

@end
