//
//  PublicTable.m
//  dbc
//
//  Created by CL7RNEC on 12-4-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "PublicTable.h"
#import "MBProgressHUD.h"
@implementation PublicTable
@synthesize arrData;
@synthesize mbProgress;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}
-(void)dealloc{
    [arrData release];
    [mbProgress release];
    [super dealloc];
}
#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    self.arrData=nil;
    self.mbProgress=nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
#pragma mark other
-(void)startProg:(NSString *)paramInfo{
    //设置加载等待
    self.mbProgress = [[[MBProgressHUD alloc] initWithView:self.view]autorelease];
    [self.view addSubview:self.mbProgress];
    [self.view bringSubviewToFront:self.mbProgress];
    self.mbProgress.delegate = (id)self;
    self.mbProgress.labelText = paramInfo;
    [self.mbProgress show:YES];
}
-(void)endProg{
    [self.mbProgress removeFromSuperview];
    self.mbProgress = nil;
}
-(void)appendTableWith:(NSMutableArray *)data {
    CLog(@"\n[appendTableWith-1]");
    for (int i=0;i<[data count];i++) { 
        [self.arrData addObject:[data objectAtIndex:i]];
    }
    CLog(@"\n[appendTableWith-2]");
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    for (int i = 0; i < [data count]; i++) { 
        NSIndexPath *newPath=[NSIndexPath indexPathForRow:[self.arrData indexOfObject:[data objectAtIndex:i]] inSection:0];
        [arr addObject:newPath];
    }
    CLog(@"\n[appendTableWith-3]");
    [self.tableView insertRowsAtIndexPaths:arr withRowAnimation:UITableViewRowAnimationFade];
    [arr release];
}
//继承自下拉刷新类的方法PullRefreshTableViewController
- (void)refresh {
    [self performSelector:@selector(pullData) withObject:nil afterDelay:1.0];
}
- (void)pullData{
    //获取信息，开启新线程并设置进度条
    [NSThread detachNewThreadSelector:@selector(getDataInfo) toTarget:self withObject:nil];
    [self startProg:@"正在加载，请稍后"];
    [self stopLoading];
}
-(void)getDataInfo{
    
}
#pragma mark - Table view data source
//获取记录数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.arrData count];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 45;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    int row=[indexPath row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    cell.textLabel.text=[self.arrData objectAtIndex:row];
    return cell;
}
#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
@end
