//
//  ViewController.m
//  NewTable
//
//  Created by Zhizhik on 17.11.14.
//  Copyright (c) 2014 Zhizhik. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource> {

}
@property (nonatomic, strong) UITableView *tableCode;
@property (nonatomic, weak) IBOutlet UITableView *tableIB;
@property (nonatomic, strong) NSArray *rock;
@property (nonatomic, strong) NSArray *pop;


@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _rock = [[NSArray alloc] initWithObjects:@"Depeche mode", @"Stigmata", @"[Amatory]", @"RHP", nil];
    _pop = [[NSArray alloc]initWithObjects: @"Dima Bilan", @"Ani Lorak", @"Vlad Topalov", @"Serhiy Lazarev", nil];
    [self addTableView];
    
    
}

-(void)addTableView {
    _tableCode = [[UITableView alloc]init];
    CGRect halfFrame = self.view.frame;
    halfFrame.size.width = halfFrame.size.width/2;
    halfFrame.origin.x = halfFrame.size.width;
    _tableCode.frame = halfFrame;
    _tableCode.dataSource = self;
    
    [self.view addSubview:_tableCode];
    
}

-(NSArray *) changeArrayForTable:(UITableView *) table {
    if (table == _tableIB){
        return _pop;
    }
    return _rock;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *array = [self changeArrayForTable:tableView];
    return [array count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
   NSArray *array = [self changeArrayForTable:tableView];
    cell.textLabel.text = [array objectAtIndex:indexPath.row];
    return cell;

} @end
