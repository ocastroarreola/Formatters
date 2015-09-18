//
//  ViewController.m
//  Formatters
//
//  Created by Omar Jair Castro Arreola on 9/16/15.
//  Copyright (c) 2015 Omar Jair Castro Arreola. All rights reserved.
//

#import "ViewController.h"
#import "Message.h"
#import "CustomTableViewCell.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray * dataSource;

@end

@implementation ViewController

-(NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc]init];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"dd/mm/yyyy"];

    for (int i = 0; i < 5; i++) {
        Message * m = [[Message alloc]init];
        if (i % 2 == 0) {
            m.header = @"Lorem ipsum dolor sit amet";
            m.content = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
        } else {
            m.header = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit";
            m.content = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat";
        }
        if (i == 2) {
            m.footer = @"";
        } else {
            m.footer = @"est laborum";
        }
        if (i == 3) {
            m.date = @"";
        } else {
            m.date = [formatter stringFromDate:[NSDate date]];
        }
        m.mainAction = [NSString stringWithFormat:@"Main %d", i +1];
        m.secondaryAction = [NSString stringWithFormat:@"Secondary %d", i +1];
        m.header = [m.header stringByAppendingString:[NSString stringWithFormat:@" %d",i + 1]];
        [self.dataSource addObject:m];
    }
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 100;
}

#pragma mark - UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

-(void)setUpCell:(CustomTableViewCell*)cell atIndexPath:(NSIndexPath*)indexPath{
    Message * m = [self.dataSource objectAtIndex:indexPath.row];
    cell.header.text = m.header;
    cell.content.text = m.content;
    cell.date.text = m.date;
    cell.footer.text = m.footer;
    [cell.mainButton setTitle:m.mainAction forState:UIControlStateNormal];
    [cell.secondaryButton setTitle:m.secondaryAction forState:UIControlStateNormal];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell * cell = (CustomTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"cell"];
    [self setUpCell:cell atIndexPath:indexPath];
    return cell;
}

#pragma mark - UITableViewDelegate

#if __IPHONE_OS_VERSION_MAX_ALLOWED <= 80000
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    static CustomTableViewCell * cell;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cell = (CustomTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"cell"];
    });
    [self setUpCell:cell atIndexPath:indexPath];
    [cell setNeedsLayout];
    [cell layoutIfNeeded];
    CGSize size = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size.height;
}
#endif
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath
                             animated:YES];
}

@end
