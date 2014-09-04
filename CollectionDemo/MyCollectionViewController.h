//
//  MyCollectionViewController.h
//  CollectionDemo
//
//  Created by Weinstein, Randy - Nick.com on 9/3/14.
//  Copyright (c) 2014 fakeancient. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCollectionViewCell.h"
#import "MySupplementaryView.h"

@interface MyCollectionViewController : UICollectionViewController
<UICollectionViewDataSource,UICollectionViewDelegate>
@property (strong, nonatomic) NSMutableArray *labels;

@end
