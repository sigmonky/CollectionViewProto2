//
//  MyCollectionViewCell.h
//  CollectionDemo
//
//  Created by Weinstein, Randy - Nick.com on 9/3/14.
//  Copyright (c) 2014 fakeancient. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *basicChordLabel;
@property (weak, nonatomic) IBOutlet UILabel *extensions;

- (void) fuckMe;
@end
