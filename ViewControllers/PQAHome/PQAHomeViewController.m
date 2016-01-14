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
#import "PQACustomTableViewCell.h"
#import "PQACardHouseAd.h"
#import "PQADetailViewController.h"

static NSString *CellIdentifier = @"CellIdentifier";

@interface PQAHomeViewController ()<UITableViewDataSource, UITableViewDelegate> {
    NSMutableArray *_list;
    NSMutableArray *_listShow;
    int _number;
}

@end

@implementation PQAHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initiliazeinFirstRun];
    //    [self addTabbarOnView:self.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    START_LOADING;
    __weak __typeof(self) weakSelf = self;
    [[NetworkManager sharedManager] getListDataFromServerAndCompletion:^(NSMutableArray *consultations) {
        _number = 0;
        _list = consultations;
        [weakSelf loadDataToShow];
        STOP_LOADING;
    }];
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (void)initiliazeinFirstRun {
    _list = [NSMutableArray new];
    _listShow = [NSMutableArray new];
    _number = 0;
    self.navigationItem.title = @"Home List View";
    
    [self.tableView addPullToRefreshWithActionHandler:^{
        [self loadDataToShow];
    } position:SVPullToRefreshPositionBottom];
    
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([PQACustomTableViewCell class]) bundle:nil] forCellReuseIdentifier:CellIdentifier];
}

- (void)loadDataToShow {
    _number += 5;
    [_listShow removeAllObjects];
    for (int i = 1; i < _number; i++) {
        NSDictionary *dict = [_list objectAtIndex:i];
        [_listShow addObject:dict];
    }
    
    [self.tableView.pullToRefreshView stopAnimating];
    [self.tableView reloadData];
}

#pragma mark - UITableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _listShow.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 250.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PQACustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[PQACustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSDictionary *firstDict = [_list firstObject];
    PQACardHouseAd *house_ad = [[PQACardHouseAd alloc] initWithDictionary:firstDict error:nil];
    
    NSDictionary *dict = [_listShow objectAtIndex:(indexPath.section)];
    PQACards *objConsultation = [[PQACards alloc] initWithDictionary:dict error:nil];
    
    cell.house_ad = house_ad;
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [cell fillDataToCell:objConsultation];
    [cell setBackgroundColor:RGBCOLOR(239, 239, 244)];
    
    return cell;
}

#pragma mark - UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PQADetailViewController *detaileView = [[PQADetailViewController alloc] initWithNibName:NSStringFromClass([PQADetailViewController class]) bundle:nil];
    
    NSDictionary *dict = [_listShow objectAtIndex:(indexPath.section)];
    PQACards *objConsultation = [[PQACards alloc] initWithDictionary:dict error:nil];
    detaileView.currentCard = objConsultation;
    
    [self.navigationController pushViewController:detaileView animated:YES];
}

- (void)addCenterButton {
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0.0, 0.0, 60.0, 60.0);
    [button setBackgroundImage:[UIImage imageNamed:@"IconCenter"] forState:UIControlStateNormal];
    
    CGFloat heightDifference = buttonImage.size.height - self.customTabBar.frame.size.height;
    
    if (heightDifference < 0)
        button.center = self.customTabBar.center;
    else
    {
        CGPoint center = self.customTabBar.center;
        center.y = center.y - heightDifference/2.0;
        button.center = center;
    }
    
    [self.view addSubview:button];
}

@end
