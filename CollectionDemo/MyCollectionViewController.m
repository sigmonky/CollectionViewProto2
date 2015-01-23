//
//  MyCollectionViewController.m
//  CollectionDemo
//
//  Created by Weinstein, Randy - Nick.com on 9/3/14.
//  Copyright (c) 2014 fakeancient. All rights reserved.
//

#import "MyCollectionViewController.h"

@interface MyCollectionViewController ()

@end

@implementation MyCollectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _labels = [@[@"label1",@"label2",@"label3",@"label4",@"label5",@"label6",@"label7",@"label8",@"label9",@"label10",@"label11",@"label12",@"label13",@"label14",@"label15",@"label1",@"label2",@"label3",@"label4",@"label5",@"label6",@"label7",@"label8",@"label9",@"label10",@"label11",@"label12",@"label13",@"label14",@"label15"] mutableCopy];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _labels.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MyCollectionViewCell *myCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyCell" forIndexPath:indexPath];
    
    long row = [indexPath row];
    
    myCell.labelView.text = _labels[row];
    
    return myCell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    MySupplementaryView *header = nil;
    
    if ([kind isEqual:UICollectionElementKindSectionHeader]) {
        header = [collectionView
                  dequeueReusableSupplementaryViewOfKind:kind
                  withReuseIdentifier:@"MyHeader"
                  forIndexPath:indexPath];
        header.headerLabel.text = @"The Song";
    }
    
    return header;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
