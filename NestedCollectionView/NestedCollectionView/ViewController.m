//
//  ViewController.m
//  NestedCollectionView
//
//  Created by Randy Weinstein on 1/27/15.
//  Copyright (c) 2015 CheesefuckDaddy. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _labels = [@[@"C",@"C",@"E7",@"E7",
                 @"A7",@"A7",@"Dm",@"Dm",
                 @"E7",@"E7",@"Am",@"Am",
                 @"D7",@"D7",@"Dm7",@"G7"] mutableCopy];

    
    
    _theChanges.delegate = self;
    _theChanges.dataSource = self;

}


#pragma mark - UICollectionView DataSource

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _labels.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MyCollectionViewCell *myCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Measure" forIndexPath:indexPath];
    
    long row = [indexPath row];
    
    //myCell.labelView.backgroundColor = [UIColor yellowColor];
    NSLog(@"cellForItem %@ -- %@",[collectionView indexPathsForSelectedItems],indexPath);
    if (self.selectedCell) {
        //myCell.labelView.backgroundColor = [UIColor yellowColor];
        myCell.labelView.text = _labels[row];
        if (self.lastSelectedCell) {
            self.lastSelectedCell.labelView.backgroundColor = [UIColor lightGrayColor];
        }
        self.lastSelectedCell = myCell;
        self.selectedCell = nil;
    }
    return myCell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // MyCollectionViewCell *myCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyCell" forIndexPath:indexPath];
    
    self.selectedCell = indexPath;
    [collectionView reloadItemsAtIndexPaths:@[indexPath]];
    
    
}

- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    MyCollectionViewCell *myCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Measure" forIndexPath:indexPath];
    NSLog(@"highlight -- %@ -- %@",[collectionView indexPathsForSelectedItems],indexPath);
    //myCell.labelView.backgroundColor = [UIColor yellowColor];
    self.selectedCell = indexPath;
    
}


#pragma mark collection view cell layout / size
#pragma mark Collection view layout things
// Layout: Set cell size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    //NSLog(@"SETTING SIZE FOR ITEM AT INDEX %d", indexPath.row);
    CGSize mElementSize = CGSizeMake(74, 50);
    return mElementSize;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0.0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 1.0;
}

// Layout: Set Edges
- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    //return UIEdgeInsetsMake(0,8,0,8);  // top, left, bottom, right
    return UIEdgeInsetsMake(0,0,0,0);  // top, left, bottom, right
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
