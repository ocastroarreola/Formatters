//
//  CustomTableViewCell.h
//  Formatters
//
//  Created by Omar Jair Castro Arreola on 9/17/15.
//  Copyright (c) 2015 Omar Jair Castro Arreola. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "CustomLabel.h"

@interface CustomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *header;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UILabel *footer;
@property (weak, nonatomic) IBOutlet UIButton *mainButton;
@property (weak, nonatomic) IBOutlet UIButton *secondaryButton;

@end
