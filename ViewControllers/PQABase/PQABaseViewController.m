//
//  PQABaseViewController.m
//  pricanQAbyGMO-ObjC
//
//  Created by DEV-MinhNN on 1/12/16.
//  Copyright © 2016 DEV-MinhNN. All rights reserved.
//

#import "PQABaseViewController.h"

@interface PQABaseViewController ()

@end

@implementation PQABaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupNavigationBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (void)setupNavigationBar {
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setBarTintColor:RGBCOLOR(255, 134, 161)];
    [[UINavigationBar appearance] setBarStyle:UIBarStyleDefault];
    //    [[UINavigationBar appearance] setTitleTextAttributes:@{UITextAttributeTextColor : [UIColor whiteColor]}];
}

//- (void)addRighrButtonBarOnMenuBar {
//    self.pqaBaseNavigationBar = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([PQABaseNavigationBar class]) owner:self options:nil] objectAtIndex:0];
//    [self.view addSubview:self.pqaBaseNavigationBar];
//}

@end
