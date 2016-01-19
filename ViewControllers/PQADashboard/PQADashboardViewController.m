//
//  PQADashboardViewController.m
//  pricanQAbyGMO-ObjC
//
//  Created by DEV-MinhNN on 1/12/16.
//  Copyright © 2016 DEV-MinhNN. All rights reserved.
//

#import "PQADashboardViewController.h"
#import "PQAHomeViewController.h"

static const CGFloat kTabBarHeight = 50;

@interface PQADashboardViewController ()

@end

@implementation PQADashboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self createTabBarView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    CGRect tabFrame = self.tabBar.frame;
    tabFrame.size.height = kTabBarHeight;
    tabFrame.origin.y = self.view.frame.size.height - kTabBarHeight;
    self.tabBar.frame = tabFrame;
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
    [searchVC.view setBackgroundColor:[UIColor purpleColor]];
    
    PQABaseViewController *InforVC = [[PQABaseViewController alloc] init];
    [InforVC.view setBackgroundColor:[UIColor lightGrayColor]];
    
    PQABaseViewController *myPageVC = [[PQABaseViewController alloc] init];
    [myPageVC.view setBackgroundColor:[UIColor blueColor]];
    
    UINavigationController *centerNav = [[UINavigationController alloc] initWithRootViewController:centerVC];
    centerNav.navigationBarHidden = NO;
    centerNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"" image:[[UIImage imageNamed:@"IconCenter"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"IconCenter"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    centerNav.tabBarItem.tag = 3;
    
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:homeVC];
    homeNav.navigationBarHidden = NO;
    homeNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Home" image:[[UIImage imageNamed:@"IconHome"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"IconHome-ac"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    homeNav.tabBarItem.tag = 1;
    
    UINavigationController *searchNav = [[UINavigationController alloc] initWithRootViewController:searchVC];
    searchNav.navigationBarHidden = NO;
    searchNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Search" image:[[UIImage imageNamed:@"IconSearch"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"IconSearch-ac"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    searchNav.tabBarItem.tag = 2;
    
    UINavigationController *informationNav = [[UINavigationController alloc] initWithRootViewController:InforVC];
    informationNav.navigationBarHidden = NO;
    informationNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Information" image:[[UIImage imageNamed:@"IconInfor"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"IconInfor-ac"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    informationNav.tabBarItem.tag = 3;
    
    UINavigationController *myPageNav = [[UINavigationController alloc] initWithRootViewController:myPageVC];
    myPageNav.navigationBarHidden = NO;
    myPageNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Search" image:[[UIImage imageNamed:@"IconMyPage"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"IconMyPage-ac"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    myPageNav.tabBarItem.tag = 4;
    
    self.viewControllers = [[NSArray alloc] initWithObjects:homeNav, searchNav, centerNav, informationNav, myPageNav, nil];
}

@end
