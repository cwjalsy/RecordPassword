//
//  HomeViewController.m
//  RecordPassword
//
//  Created by wenjim on 17/8/10.
//  Copyright © 2017年 WenJim. All rights reserved.
//

#import "HomeViewController.h"

#define NavigationCOLOR WJColor(247, 186, 65, 0.9)

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView * tableView;

@end

@implementation HomeViewController

#pragma mark - lazyLoading
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        // 没有分割线
//        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = KRedColor;
    
//    // 设置透明度
//    self.navigationController.navigationBar.alpha = 0.5;
//    // 设置半透明
//    self.navigationController.navigationBar.translucent = YES;
    
    self.title = @"记录";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"新建" style:UIBarButtonItemStylePlain target:self action:@selector(setNew)];
    
    [self setUpAllControls];
}

#pragma mark - 新建
-(void)setNew
{
    DLog(@"新建界面");
}

#pragma mark - UI控件布局
-(void)setUpAllControls
{
    [self.view addSubview:self.tableView];
    
    [self layoutAllSubViews];
}

#pragma mark - 添加tableView约束布局
-(void)layoutAllSubViews
{
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

#pragma mark - 设置分组里需要多少行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

#pragma  mark - 设置分组每行的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

#pragma mark - 填充tableview 各组各行的内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * Identifier = @"CellID";
    
    UITableViewCell * cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:Identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:Identifier];
    }
    
    cell.textLabel.text = @"升级啦";
    
    //去掉底部多余的表格线
    [tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    // 设置选中时的背景色
    cell.selectedBackgroundView = [[UIView alloc]initWithFrame:cell.frame];
    cell.selectedBackgroundView.backgroundColor = NavigationCOLOR;
    
    return cell;
}

#pragma mark - 点击对应的 tableview 的效果
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DLog(@"点击第%ld个",indexPath.row);
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 设置导航条的背景颜色
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    // 设置导航条的阴影图片
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    // 设置导航条的标题颜色
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:KYellowColor}];
    
    
//    self.navigationController.navigationBar.barTintColor = NavigationCOLOR;
    self.navigationController.navigationBar.backgroundColor = NavigationCOLOR;
    
    // TODO: 设置状态栏颜色
    [self setStatusBarBackgroundColor:NavigationCOLOR];
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    
}

#pragma mark - 设置状态栏颜色
- (void)setStatusBarBackgroundColor:(UIColor *)color {
    
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}

@end
