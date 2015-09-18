//
//  Message.h
//  Formatters
//
//  Created by Omar Jair Castro Arreola on 9/17/15.
//  Copyright (c) 2015 Omar Jair Castro Arreola. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Message : NSObject

@property (nonatomic, strong) NSString * header;
@property (nonatomic, strong) NSString * content;
@property (nonatomic, strong) NSString * date;
@property (nonatomic, strong) NSString * footer;
@property (nonatomic, strong) NSString * mainAction;
@property (nonatomic, strong) NSString * secondaryAction;

@end
