//
//  ViewController.h
//  NestedCollectionView
//
//  Created by Randy Weinstein on 1/27/15.
//  Copyright (c) 2015 CheesefuckDaddy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>
@property (strong, nonatomic) NSMutableArray *labels;
@property (weak, nonatomic) IBOutlet UICollectionView *theChanges;

@end

