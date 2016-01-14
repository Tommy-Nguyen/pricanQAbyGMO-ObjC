//
//  PQACustomTableViewCell.m
//  pricanQAbyGMO-ObjC
//
//  Created by DEV-MinhNN on 1/14/16.
//  Copyright © 2016 DEV-MinhNN. All rights reserved.
//

#import "PQACustomTableViewCell.h"

@implementation PQACustomTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    [self.viewContaint.layer setBorderWidth:1.0];
    [self.viewContaint.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [self.avatar.layer setCornerRadius:self.avatar.frame.size.width / 2];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)fillDataToCell:(PQACards *)card {
    NSString *urlDefault = [card.consultation.thumbnail_urls valueForKey:@"default"];
    NSURL *imageURL = [NSURL URLWithString:urlDefault];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.avatar.image = [UIImage imageWithData:imageData];
        });
    });
    
    
    [self.fullName setText:card.consultation.nickname];
    [self.Userdescription setText:card.consultation.objDes];
    [self.labelAge setText:[NSString stringWithFormat:@"%@年齢",card.consultation.age]];
    
    [self.numberComment setText:card.consultation.comment_count];
    [self.numberLike setText:card.consultation.like_count];
    [self.numberWatch setText:card.consultation.watch_count];

}

- (IBAction)pressButtonAction:(id)sender {
    NSString *action = self.house_ad.house_ad.action;
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"What do you want to do with the record?"
                                                             delegate:self
                                                    cancelButtonTitle:@"Cancel"
                                               destructiveButtonTitle:@""
                                                    otherButtonTitles:action, nil];
    
    [actionSheet showInView:self.viewContaint];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    //
}

@end
