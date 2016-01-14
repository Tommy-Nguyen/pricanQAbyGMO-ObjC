//
//  PQABaseViewController.m
//  pricanQAbyGMO-ObjC
//
//  Created by DEV-MinhNN on 1/14/16.
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
    [self addRighrButtonBarOnMenuBar];
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
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
}

- (void)addRighrButtonBarOnMenuBar {
    UIButton *imageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    imageButton.frame = CGRectMake(0.0, 0.0, 40.0, 40.0);
    [imageButton setImage:[UIImage imageNamed:@"RightMenuBar"] forState:UIControlStateNormal];
    
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithCustomView:imageButton];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = 0.0;
    
    [self.navigationItem setRightBarButtonItems:[NSArray arrayWithObjects:negativeSpacer, rightBarItem, nil] animated:NO];
}

@end
