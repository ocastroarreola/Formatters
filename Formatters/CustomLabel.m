//
//  CustomLabel.m
//  Formatters
//
//  Created by Omar Jair Castro Arreola on 9/17/15.
//  Copyright (c) 2015 Omar Jair Castro Arreola. All rights reserved.
//

#import "CustomLabel.h"

@implementation CustomLabel

-(void)layoutSubviews {
    [super layoutSubviews];
    if (self.numberOfLines == 0 && self.preferredMaxLayoutWidth != CGRectGetWidth(self.frame)) {
        self.preferredMaxLayoutWidth = self.frame.size.width;
        [self setNeedsUpdateConstraints];
    }
}

- (CGSize)intrinsicContentSize
{
    CGSize s = [super intrinsicContentSize];
    
    if (self.numberOfLines == 0) {
        // found out that sometimes intrinsicContentSize is 1pt too short!
        s.height += 1;
    }
    
    return s;
}

@end
