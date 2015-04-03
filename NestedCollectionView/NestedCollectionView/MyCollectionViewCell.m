//
//  MyCollectionViewCell.m
//  CollectionDemo
//
//  Created by Weinstein, Randy - Nick.com on 9/3/14.
//  Copyright (c) 2014 fakeancient. All rights reserved.
//

#import "MyCollectionViewCell.h"

@implementation MyCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) fuckMe {
    self.basicChordLabel.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.5];
    [self setNeedsDisplay];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
