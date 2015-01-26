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
    _labels = [@[@"C",@"F",@"G7",@"C",@"label5",@"label6",@"label7",@"label8",@"label9",@"label10",@"label11",@"label12",@"label13",@"label14",@"label15",@"label1",@"label2",@"label3",@"label4",@"label5",@"label6",@"label7",@"label8",@"label9",@"label10",@"label11",@"label12",@"label13",@"label14",@"label15"] mutableCopy];
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
    
    //myCell.labelView.backgroundColor = [UIColor yellowColor];

    
    
    NSLog(@"%@ -- %@",[collectionView indexPathsForSelectedItems],indexPath);
    if (self.selectedCell) {
        myCell.labelView.backgroundColor = [UIColor yellowColor];
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
    MyCollectionViewCell *myCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyCell" forIndexPath:indexPath];
    
    myCell.labelView.backgroundColor = [UIColor yellowColor];
    self.selectedCell = myCell;
    
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

- (IBAction)selectCell:(id)sender {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:8 inSection:0];
    
    [self.collectionView selectItemAtIndexPath:indexPath animated:TRUE                        scrollPosition:UICollectionViewScrollPositionNone];
    
    self.selectedCell = indexPath;
    [self.collectionView reloadItemsAtIndexPaths:@[indexPath]];
    
}
@end
