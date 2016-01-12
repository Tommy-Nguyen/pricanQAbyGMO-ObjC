//
//  PQADashboardViewController.m
//  pricanQAbyGMO-ObjC
//
//  Created by DEV-MinhNN on 1/12/16.
//  Copyright © 2016 DEV-MinhNN. All rights reserved.
//

#import "PQADashboardViewController.h"
#import "PQAHomeViewController.h"

@interface PQADashboardViewController ()<UITabBarDelegate>

@end

@implementation PQADashboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

- (void)createTabBarView {
    PQAHomeViewController *centerVC = [[PQAHomeViewController alloc] initWithNibName:NSStringFromClass([PQAHomeViewController class]) bundle:nil];
    
    PQABaseViewController *homeVC = [[PQABaseViewController alloc] init];
    [homeVC.view setBackgroundColor:[UIColor greenColor]];
    
    PQABaseViewController *searchVC = [[PQABaseViewController alloc] init];
    [searchVC.view setBackgroundColor:[UIColor greenColor]];
    
    PQABaseViewController *InforVC = [[PQABaseViewController alloc] init];
    [InforVC.view setBackgroundColor:[UIColor greenColor]];
    
    PQABaseViewController *myPageVC = [[PQABaseViewController alloc] init];
    [myPageVC.view setBackgroundColor:[UIColor greenColor]];
    
    //
}

@end
