//
//  BUDDrawVideoViewController.m
//  BUDemo
//
//  Created by 崔亚楠 on 2018/9/20.
//  Copyright © 2018年 bytedance. All rights reserved.
//

#import "BUDDrawVideoViewController.h"
#import <BUAdSDK/BUNativeAdsManager.h>
#import "BUDDrawTableViewCell.h"

@interface BUDDrawVideoViewController ()<UITableViewDataSource, UITableViewDelegate, BUNativeAdsManagerDelegate, BUVideoAdViewDelegate,BUNativeAdDelegate>
@property (strong, nonatomic) UITableView *tableView;
@property (nonatomic, strong) BUNativeAdsManager *adManager;
@property (nonatomic, strong) NSArray *dataSource;
@end

@implementation BUDDrawVideoViewController

- (void)dealloc {
    _tableView.delegate = nil;
    _adManager.delegate = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.pagingEnabled = YES;
    [self.view addSubview:self.tableView];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerClass:[BUDDrawNormalTableViewCell class] forCellReuseIdentifier:@"BUDDrawNormalTableViewCell"];
    [self.tableView registerClass:[BUDDrawAdTableViewCell class] forCellReuseIdentifier:@"BUDDrawAdTableViewCell"];
    [self.tableView registerClass:[BUDDrawBaseTableViewCell class] forCellReuseIdentifier:@"BUDDrawBaseTableViewCell"];
    
    [self loadNativeAds];
    
    NSMutableArray *datas = [NSMutableArray array];
    for (NSInteger i =0 ; i <= 15; i++) {
        [datas addObject:@"App的tableViewcell"];
    }
    self.dataSource = [datas copy];
    
    [self.tableView reloadData];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(10, 34, 80, 40);
    [btn setTitle:@"默默返回" forState:UIControlStateNormal];
    btn.tintColor = [UIColor darkGrayColor];
    btn.backgroundColor = [UIColor brownColor];
    [btn addTarget:self action:@selector(closeVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view bringSubviewToFront:btn];
    [self.view addSubview:btn];
}

- (void)closeVC{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -- adsManager
- (void)loadNativeAds {
    BUNativeAdsManager *nad = [BUNativeAdsManager new];
    BUAdSlot *slot1 = [[BUAdSlot alloc] init];
    slot1.ID = self.viewModel.slotID;
    slot1.AdType = BUAdSlotAdTypeDrawVideo; //必须
    slot1.isOriginAd = YES; //必须
    slot1.position = BUAdSlotPositionTop;
    slot1.imgSize = [BUSize sizeBy:BUProposalSize_DrawFullScreen];
    slot1.isSupportDeepLink = YES;
    nad.adslot = slot1;
    nad.delegate = self;
    self.adManager = nad;
    
    [nad loadAdDataWithCount:3];
}
- (void)nativeAdsManagerSuccessToLoad:(BUNativeAdsManager *)adsManager nativeAds:(NSArray<BUNativeAd *> *_Nullable)nativeAdDataArray {
    
    NSMutableArray *dataSources = [self.dataSource mutableCopy];
    for (BUNativeAd *model in nativeAdDataArray) {
        NSUInteger index = rand() % dataSources.count;
        [dataSources insertObject:model atIndex:index];
    }
    self.dataSource = [dataSources copy];
    
    [self.tableView reloadData];
}

- (void)nativeAdsManager:(BUNativeAdsManager *)adsManager didFailWithError:(NSError *_Nullable)error {
    NSLog(@"%s %@", __PRETTY_FUNCTION__, error);
}

#pragma mark --- BUVideoAdViewDelegate
- (void)videoAdView:(BUVideoAdView *)videoAdView stateDidChanged:(BUPlayerPlayState)playerState {
    NSLog(@"videoAdView state change to %ld", (long)playerState);
}

- (void)videoAdView:(BUVideoAdView *)videoAdView didLoadFailWithError:(NSError *)error {
    NSLog(@"videoAdView didLoadFailWithError");
}

- (void)playerDidPlayFinish:(BUVideoAdView *)videoAdView {
    NSLog(@"videoAdView didPlayFinish");
}

#pragma mark --- tableView dataSource&delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger index = indexPath.row;
    id model = self.dataSource[index];
    if ([model isKindOfClass:[BUNativeAd class]]) {
        BUNativeAd *nativeAd = (BUNativeAd *)model;
        nativeAd.rootViewController = self;
        BUDDrawAdTableViewCell *cell = nil;
        cell = [tableView dequeueReusableCellWithIdentifier:@"BUDDrawAdTableViewCell" forIndexPath:indexPath];
        cell.nativeAdRelatedView.videoAdView.delegate = self;
        [cell refreshUIWithModel:nativeAd];
        [model registerContainer:cell withClickableViews:@[cell.creativeButton]];
        
        return cell;
    }else{
        BUDDrawNormalTableViewCell *cell = nil;
        cell = [tableView dequeueReusableCellWithIdentifier:@"BUDDrawNormalTableViewCell" forIndexPath:indexPath];
        [cell refreshUIAtIndex:index];
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [BUDDrawBaseTableViewCell cellHeight];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
