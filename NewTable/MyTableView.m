//
//  MyTableView.m
//  NewTable
//
//  Created by Zhizhik on 17.11.14.
//  Copyright (c) 2014 Zhizhik. All rights reserved.
//
#import "MyTableView.h"

@interface MyTableViewController ()<UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic,strong) IBOutlet UITableView *interfaceTable;
@end

@implementation MyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] init];
    self.tableView.frame = self.view.frame;
    [self.view addSubview:self.tableView];
    
    self.tableView.dataSource = self;
    
    self.items = [[NSArray alloc] initWithObjects:@"Sound", @"Display", @"Date", @"Password", nil];
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.items count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.textLabel.text = self.items[indexPath.row];
    return cell;
}

@end