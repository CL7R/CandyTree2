//
//  PublicSearchInfo.m
//  dbc_passenger
//
//  Created by 孔 晨阳 on 12-11-21.
//  Copyright (c) 2012年 孔 晨阳. All rights reserved.
//

#import "PublicSearchInfo.h"
#import "PublicCheck.h"
@interface PublicSearchInfo ()

@end

@implementation PublicSearchInfo
@synthesize searchFlag;
@synthesize delegate;
@synthesize arrInfo;
@synthesize searchKey;
@synthesize tableInfo;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark init
-(void)initData{
    NSMutableArray *arr=[[NSMutableArray alloc]init];
    self.arrInfo=arr;
    [arr release];
    //注册通知
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(createTableInfo:)
                                                 name: @"createTableInfo"
                                               object: nil];
}
-(void)initView{
    UISearchBar *search=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 48.5, 320, 40)];
    search.delegate=(id)self;
    [search setTintColor:[UIColor colorWithRed:0.7019 green:0.7019 blue:0.7019 alpha:1]];
    self.searchKey=search;
    [self.searchKey setHidden:YES];
    [search release];
    UITableView *table=[[UITableView alloc]initWithFrame:CGRectMake(0, 88.5, 320, 0) style:UITableViewStylePlain];
    table.delegate=(id)self;
    table.dataSource=(id)self;
    self.tableInfo=table;
    [table release];
}
#pragma mark other
- (void)setTableHidden:(BOOL)hidden {
	int height = hidden ? 0 : 230;
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:.2];
    CGRect frame=self.tableInfo.frame;
    frame.size.height=height;
    self.tableInfo.frame=frame;
	//[self.tableInfo setFrame:CGRectMake(0, 88.5, 320,height)];
	[UIView commitAnimations];
}
- (void)setSearchHidden:(BOOL)hidden{
    [self.searchKey setHidden:hidden];
    /*int height = hidden ? 0 : 40;
     [UIView beginAnimations:nil context:nil];
     [UIView setAnimationDuration:.2];
     [self.searchKey setFrame:CGRectMake(0, 48.5, 320,height)];
     [UIView commitAnimations];*/
}
-(void)createTableInfo:(NSNotification *)noti{
    /*MapTemplateBaidu *map=[MapTemplateBaidu getInstance];
    map.poiResult=[noti object];
    CLog(@"\n[createTableInfo-1]%@",map.poiResult);
    if (map.poiResult) {
        [self.arrInfo removeAllObjects];
        for (int i = 0; i < map.poiResult.poiInfoList.count; i++) {
            BMKPoiInfo* poi = [map.poiResult.poiInfoList objectAtIndex:i];
            NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:poi.name,@"name",[NSString stringWithFormat:@"%f",poi.pt.latitude],@"latitude",[NSString stringWithFormat:@"%f",poi.pt.longitude],@"longitude", nil];
            [self.arrInfo addObject:dic];
            CLog(@"\n[createTableInfo-2]%@\n%f",poi.name,poi.pt.latitude);
        }
        [self.tableInfo reloadData];
        [self setTableHidden:NO];
    }
    else{
        [self setTableHidden:YES];
    }*/
}
#pragma mark -
#pragma mark Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.arrInfo count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
	NSUInteger row = [indexPath row];
    NSDictionary *dic=[self.arrInfo objectAtIndex:row];
	cell.textLabel.text = [dic objectForKey:@"name"];
    [cell.textLabel setFont:[UIFont systemFontOfSize:12]];
    return cell;
}

#pragma mark -
#pragma mark Table view delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 24;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dic = [self.arrInfo objectAtIndex:[indexPath row]];
    CLog(@"\n[didSelectRowAtIndexPath]");
    [delegate selectInfoName:dic];
}
#pragma mark search bar delegate
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    CLog(@"\n[textDidChange]%@,%d",searchText,searchBar.tag);
    if (searchBar.tag!=100) {
        if(![PublicCheck validateEmpty:searchText]){
            //开始搜索
            //MapTemplateBaidu *map=[MapTemplateBaidu getInstance];
            //map.searchPlaceFlag=1;
            //[map getMapNameByNameKey:searchBar.text];
        }
    }
}
-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    CLog(@"\n[searchBarTextDidBeginEditing]");
    [searchBar setShowsCancelButton:YES animated:YES];
}
-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
    CLog(@"\n[searchBarTextDidEndEditing]");
    [searchBar setShowsCancelButton:NO animated:YES];
}
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    CLog(@"\n[searchBarCancelButtonClicked]");
    searchBar.text=@"";
    [searchBar resignFirstResponder];
    if (searchFlag==0) {
        [self setSearchHidden:YES];
    }
}
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    CLog(@"\n[searchBarSearchButtonClicked]");
    if(![PublicCheck validateEmpty:searchBar.text]){
        //开始搜索
        //MapTemplateBaidu *map=[MapTemplateBaidu getInstance];
        //map.searchPlaceFlag=1;
        //[map getMapNameByNameKey:searchBar.text];
    }
    [searchBar resignFirstResponder];
    //[self setSearchHidden:YES];
}
@end

