//
//  PQAHomeViewController.m
//  pricanQAbyGMO-ObjC
//
//  Created by DEV-MinhNN on 1/12/16.
//  Copyright © 2016 DEV-MinhNN. All rights reserved.
//

#import "PQAHomeViewController.h"
#import "NetworkManager.h"
#import "PQACards.h"

@interface PQAHomeViewController ()

@end

@implementation PQAHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [[NetworkManager sharedManager] getListDataFromServerAndCompletion:^(MFResponse *responseObject) {
        PQACards *responseCard = [[PQACards alloc] initWithDictionary:responseObject.cards error:nil];
        DLog(@"response -- %@", responseCard);
    }];
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

@end
