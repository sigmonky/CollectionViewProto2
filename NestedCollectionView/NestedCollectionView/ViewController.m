//
//  ViewController.m
//  NestedCollectionView
//
//  Created by Randy Weinstein on 1/27/15.
//  Copyright (c) 2015 CheesefuckDaddy. All rights reserved.
//

#import "ViewController.h"
#import "ChordViewController.h"
#import "PlaybackController.h"
#import "Chord.h"
#import "Progression.h"

@interface ViewController ()
@property UIViewController  *currentDataEntryVC;
@property Progression *progression;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    _progression = [[Progression alloc ] init];
    
    NSNumber *sixthExt = [Chord extension:Six];
    _progression.chordProgression = (NSMutableArray *)@
    [
     [[Chord alloc] initWithRoot:60  quality:ChordQualityMajor extension:(NSMutableArray *)@[[Chord extension:Six]]],
     [[Chord alloc] initWithRoot:60  quality:ChordQualityMajor extension:nil],
     [[Chord alloc] initWithRoot:64 quality:ChordQualityDominant extension:nil],
     [[Chord alloc] initWithRoot:64 quality:ChordQualityDominant extension:nil],
     [[Chord alloc] initWithRoot:69 quality:ChordQualityDominant extension:nil],
     [[Chord alloc] initWithRoot:69 quality:ChordQualityDominant extension:nil],
     [[Chord alloc] initWithRoot:62 quality:ChordQualityMinor extension:nil],
     [[Chord alloc] initWithRoot:62 quality:ChordQualityMinor extension:nil],
     [[Chord alloc] initWithRoot:64 quality:ChordQualityDominant extension:nil],
     [[Chord alloc] initWithRoot:64 quality:ChordQualityDominant extension:nil],
     [[Chord alloc] initWithRoot:69 quality:ChordQualityMinor extension:nil],
     [[Chord alloc] initWithRoot:69 quality:ChordQualityMinor extension:nil],
     [[Chord alloc] initWithRoot:62 quality:ChordQualityDominant extension:nil],
     [[Chord alloc] initWithRoot:62 quality:ChordQualityDominant extension:nil],
     [[Chord alloc] initWithRoot:62 quality:ChordQualityMinor extension:nil],
     [[Chord alloc] initWithRoot:67 quality:ChordQualityDominant extension:nil]
     ];
    
    
    
    _theChanges.delegate = self;
    _theChanges.dataSource = self;

}


#pragma mark - UICollectionView DataSource

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _progression.chordProgression.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MyCollectionViewCell *myCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Measure" forIndexPath:indexPath];
    
    long row = [indexPath row];
    
    //myCell.labelView.backgroundColor = [UIColor yellowColor];
    myCell.labelView.text = [_progression.chordProgression[row] chordSymbol];
    NSLog(@"cellForItem %@ -- %@",[collectionView indexPathsForSelectedItems],indexPath);
    /*if (self.selectedCell) {
        //myCell.labelView.backgroundColor = [UIColor yellowColor];
        
        if (self.lastSelectedCell) {
            self.lastSelectedCell.labelView.backgroundColor = [UIColor lightGrayColor];
        }
        self.lastSelectedCell = myCell;
        self.selectedCell = nil;
    }*/
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

- (IBAction)chordSelected:(id)sender {
    ChordViewController *chordVC = [self.storyboard instantiateViewControllerWithIdentifier:@"chordEntry"];
    [self presentEntryController:chordVC];
}

- (IBAction)playbackSelected:(id)sender {
    PlaybackController *playbackVC = [self.storyboard instantiateViewControllerWithIdentifier:@"playbackControls"];
    [self presentEntryController:playbackVC];

}

- (void)presentEntryController:(UIViewController*)entryVC{
    
    //0. Remove the current Detail View Controller showed
    if(self.currentDataEntryVC){
        [self removeCurrentDataEntryVC];
        
    }
    
    
    
    //2. Define the detail controller's view size
    CGRect bounds = self.containerView.bounds;
    
    entryVC.view.frame = CGRectMake(-500,0, bounds.size.width, bounds.size.height);
    
    //3. Add the Detail controller's view to the Container's detail view and save a reference to the detail View Controller
    //1. Add the detail controller as child of the container
    [self addChildViewController:entryVC];
    [self.containerView addSubview:entryVC.view];
    self.currentDataEntryVC = entryVC;
    
    
    CGRect newEntryVCFrame = entryVC.view.frame;
    newEntryVCFrame.origin.x += 500;    // shift right by 500pts
    
    [UIView animateWithDuration:0.25
                     animations:^{
                         entryVC.view.frame = newEntryVCFrame;
                         [entryVC didMoveToParentViewController:self];
                     }];
    
    //4. Complete the add flow calling the function didMoveToParentViewController (wow)
    
    
}

- (void)removeCurrentDataEntryVC{
    
    CGRect oldEntryVCFrame = self.currentDataEntryVC.view.frame;
    
    oldEntryVCFrame.origin.x += 500;
    
    [UIView animateWithDuration:0.25
                     animations:^{
                         self.currentDataEntryVC.view.frame = oldEntryVCFrame;
                         //[entryVC didMoveToParentViewController:self];
                     }];
    
    //1. Call the willMoveToParentViewController with nil
    //   This is the last method where your detailViewController can perform some operations before neing removed
    [self.currentDataEntryVC willMoveToParentViewController:nil];
    
    //2. Remove the DetailViewController's view from the Container
    [self.currentDataEntryVC.view removeFromSuperview];
    
    //3. Update the hierarchy"
    //   Automatically the method didMoveToParentViewController: will be called on the detailViewController)
    [self.currentDataEntryVC removeFromParentViewController];
}

@end
