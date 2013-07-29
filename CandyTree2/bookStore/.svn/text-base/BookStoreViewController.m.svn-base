//
//  BookStoreViewController.m
//  CandyTree2
//
//  Created by fengfengxu on 13-6-5.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import "BookStoreViewController.h"
#import "BookStoreHeaderView.h" 
#import "BookStoreManager.h"
#import "MBProgressHUD.h"
#import "MBHUDView.h"
#import "BookStoreBookInfoView.h"
#import <QuartzCore/QuartzCore.h>


#define HEADER_VIEW_HEIGHT 40
#define BOOKINFO_START_X 10


#define TOP3_BOOKINFO_ROW 0
#define BOOKINFO_COUNT_EACH_ROW 5
#define BOOKINFO_WITH (1000/BOOKINFO_COUNT_EACH_ROW)
#define BOOKINFO_HEIGHT 200

@interface BookStoreViewController ()
@property(nonatomic, retain) UITableView *contenTableView;
@property(nonatomic, retain) BookStoreHeaderView *headerView;
@property(nonatomic, retain) BookStoreManager *bookStroeManager;
@property(nonatomic, retain) MBProgressHUD  *progress;
@property(nonatomic, retain) NSArray        *normalBooks;
@property(nonatomic, retain) NSArray        *topBooks;
@property(nonatomic, retain) NSMutableArray *normalBookViews;
@property(nonatomic, retain) NSMutableArray *topBooksViews;
@end

@implementation BookStoreViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    [self loadContentScrollView];
    [self loadHeaderView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self showProgress];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
//    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark private

- (void)loadContentScrollView
{
    if (!self.contenTableView) {
        self.contenTableView = [[[UITableView alloc] initWithFrame:CGRectMake(0, HEADER_VIEW_HEIGHT,SCREEN_WIDTH, SCREEN_HEIGHT - HEADER_VIEW_HEIGHT)] autorelease];
        self.contenTableView.delegate   = self;
        self.contenTableView.dataSource = self;
        self.contenTableView.separatorStyle = UITableViewCellSelectionStyleNone;
        [self.view addSubview:self.contenTableView];
    }
}


- (void)loadHeaderView
{
    if (!self.headerView) {
        self.headerView = [[[BookStoreHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, HEADER_VIEW_HEIGHT)] autorelease];
        self.headerView.backgroundColor = [UIColor grayColor];
        [self.view addSubview:self.headerView];
    }
    
}


- (void)LoadData
{
    self.bookStroeManager = [[BookStoreManager alloc] init];
    ServerErrorCode ret = [self.bookStroeManager getBookStoreInfo];
    
    dispatch_async(dispatch_get_main_queue(), ^{
//        if (ret == Server_Susccess) {
//            self.normalBooks        = self.bookStroeManager.bookInfosNormal;
//            self.normalBookViews    = [NSMutableArray arrayWithCapacity:self.normalBooks.count];
//            
//            self.topBooks           = self.bookStroeManager.bookInfosTop3;
//            self.topBooksViews      = [NSMutableArray arrayWithCapacity:self.topBooks.count];
        
        if (1) {
            
            sleep(2);
            
            self.normalBooks = [NSArray arrayWithObjects:@"",
                                @"",
                                @"",
                                @"",
                                @"",
                                @"",
                                @"",
                                @"",
                                @"",
                                @"",
                                @"",
                                @"",
                                @"",
                                @"",
                                @"",
                                @"",
                                @"",
                                @"",
                                @"",
                                @"",
                                @"",
                                @"",
                                nil];
            
            self.topBooks = [NSArray arrayWithObjects:@"", @"",@"", nil];
            
            [self.contenTableView reloadData];
        }else{
           [MBHUDView hudWithBody:NSLocalizedString(@"获取图书信息失败", nil) type:MBAlertViewHUDTypeExclamationMark hidesAfter:1.0 show:YES];
        }
        
    });
    
    
}


- (void)showProgress
{
    MBProgressHUD *progress = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:progress];
    progress.dimBackground = YES;
    [progress showWhileExecuting:@selector(LoadData) onTarget:self withObject:nil animated:YES];
    _progress = progress;
}


- (void)dealloc
{
    [self.contenTableView removeFromSuperview];
    self.contenTableView = nil;
    
    [self.headerView removeFromSuperview];
    self.headerView = nil;

    self.progress = nil;
    
    self.bookStroeManager = nil;
    self.topBooks = nil;
    self.normalBooks = nil;
    
    [super dealloc];
}


- (NSArray *)getBookStoreBookInfoByRow:(NSInteger)rowIndex
{
    if (rowIndex == TOP3_BOOKINFO_ROW) {
        return self.topBooks;
    }
    
    int startIndex = BOOKINFO_COUNT_EACH_ROW*rowIndex;
    NSMutableArray *bookInfos = [NSMutableArray arrayWithCapacity:BOOKINFO_COUNT_EACH_ROW];
    
    for (int i = startIndex; i < startIndex + BOOKINFO_COUNT_EACH_ROW && i < self.normalBooks.count; i++) {
        [bookInfos addObject:[self.normalBooks objectAtIndex:i]];
    }
    
    return bookInfos;
    
}

- (void)initBookStoreBookInfoView:(BookStoreBookInfoView *)bookInfoView and:(BookInfo *)bookInfo
{
    bookInfoView.backgroundColor = [UIColor blueColor];
    bookInfoView.layer.borderWidth = 2;
    bookInfoView.layer.borderColor = [UIColor redColor].CGColor;
}


- (void)initTableViewCell:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath
{
    NSArray *contentSubviews = cell.contentView.subviews;
    NSArray *bookInfosForCell = [self getBookStoreBookInfoByRow:indexPath.row];
    if (contentSubviews.count) {
        int i = 0;
        for (i = 0; i < contentSubviews.count && i < bookInfosForCell.count; i++) {
            BookStoreBookInfoView *bookInfoView = [contentSubviews objectAtIndex:i];
            BookInfo *bookInfo = [bookInfosForCell objectAtIndex:i];
            [self initBookStoreBookInfoView:bookInfoView and:bookInfo];
            bookInfoView.hidden = NO;
        }
        
        for (; i < contentSubviews.count; i++) {
            BookStoreBookInfoView *bookInfoView = [contentSubviews objectAtIndex:i];
            bookInfoView.hidden = YES;
        }
    }else{
        int i = 0;
        for ( i = 0 ;i < bookInfosForCell.count; i++) {
            CGRect frame = CGRectMake(BOOKINFO_START_X + BOOKINFO_WITH * i + 3, 0, BOOKINFO_WITH, BOOKINFO_HEIGHT);
            BookStoreBookInfoView *bookInfoView = [[BookStoreBookInfoView alloc] initWithFrame:frame];
            BookInfo *bookInfo = [bookInfosForCell objectAtIndex:i];
            [self initBookStoreBookInfoView:bookInfoView and:bookInfo];
            [cell.contentView addSubview:bookInfoView];
        }
        
        for ( ; i < BOOKINFO_COUNT_EACH_ROW; i++) {
            CGRect frame = CGRectMake(BOOKINFO_START_X + BOOKINFO_WITH * i , 0, BOOKINFO_WITH, BOOKINFO_HEIGHT);
            BookStoreBookInfoView *bookInfoView = [[BookStoreBookInfoView alloc] initWithFrame:frame];
            [cell.contentView addSubview:bookInfoView];
        }
        
    }
}


#pragma mark -
#pragma mark UITableView

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return BOOKINFO_HEIGHT + 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.topBooks.count == 0) {
        return 0;
    }
    if (self.normalBooks.count % BOOKINFO_COUNT_EACH_ROW) {
        return self.normalBooks.count % BOOKINFO_COUNT_EACH_ROW + 2;
    }
   
    return self.normalBooks.count % BOOKINFO_COUNT_EACH_ROW + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellNormalIndetifier   = @"normalBookInfoCell";
    static NSString *cellTopIndentifier     = @"topBookInfoCell";

    NSString *cellIndentifier = nil;
    
    if (indexPath.row == TOP3_BOOKINFO_ROW) {
        cellIndentifier = cellTopIndentifier;
    }else{
        cellIndentifier = cellNormalIndetifier;
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    
    [self initTableViewCell:cell indexPath:indexPath];
    
    
    return cell;
}

@end
