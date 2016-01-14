//
//  PQADetailViewController.m
//  pricanQAbyGMO-ObjC
//
//  Created by DEV-MinhNN on 1/14/16.
//  Copyright © 2016 DEV-MinhNN. All rights reserved.
//

#import "PQADetailViewController.h"

@interface PQADetailViewController ()

@end

@implementation PQADetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.view setBackgroundColor:RGBCOLOR(239, 239, 244)];
    [self.avatar.layer setCornerRadius:self.avatar.frame.size.height / 2];
    
    [self.scroolView setBackgroundColor:[UIColor whiteColor]];
    [self.scroolView.layer setBorderWidth:1.0];
    [self.scroolView.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
                                                         forBarMetrics:UIBarMetricsDefault];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setConTentToScrolViewAndFillData];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (void)setConTentToScrolViewAndFillData {
    self.navigationItem.title = self.currentCard.consultation.nickname;
    
    NSString *urlDefault = [self.currentCard.consultation.thumbnail_urls valueForKey:@"default"];
    NSURL *imageURL = [NSURL URLWithString:urlDefault];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.avatar.image = [UIImage imageWithData:imageData];
        });
    });
    
    self.name.text = self.currentCard.consultation.nickname;
    [self.label2 setText:[NSString stringWithFormat:@"%@年齢",self.currentCard.consultation.age]];
    
    [self.txtDescription setText:self.currentCard.consultation.objDes];
    
    [self.numberComment setText:self.currentCard.consultation.comment_count];
    [self.numberLike setText:self.currentCard.consultation.like_count];
    [self.numberWatch setText:self.currentCard.consultation.watch_count];
    
    CGFloat fixedWidth = self.txtDescription.frame.size.width;
    CGSize newSize = [self.txtDescription sizeThatFits:CGSizeMake(fixedWidth, MAXFLOAT)];
    CGRect newFrame = self.txtDescription.frame;
    newFrame.size = CGSizeMake(fmaxf(newSize.width, fixedWidth), newSize.height);
    
    self.txtDescription.frame = newFrame;
    
    [self setOriginYToView:self.viewLike andFloatY:(newFrame.origin.y + newFrame.size.height + 5.0)];
    [self setOriginYToView:self.viewComment andFloatY:(newFrame.origin.y + newFrame.size.height + 5.0)];
    [self setOriginYToView:self.viewWatch andFloatY:(newFrame.origin.y + newFrame.size.height + 5.0)];
    
    float sizeOfContent = 0;
    UIView *subViewLast = [self.viewContant.subviews lastObject];
    NSInteger wd = subViewLast.frame.origin.y;
    NSInteger ht = subViewLast.frame.size.height;
    sizeOfContent = (wd+ht + 5.0);
    
    self.scroolView.contentSize = CGSizeMake(self.scroolView.frame.size.width, sizeOfContent);
}

- (void)setOriginYToView:(UIView *)theView andFloatY:(float)y {
    [theView setFrame:CGRectMake(theView.frame.origin.x, y, theView.frame.size.width, theView.frame.size.height)];
}

@end
