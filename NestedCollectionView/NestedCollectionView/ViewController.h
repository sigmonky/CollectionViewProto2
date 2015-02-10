//
//  ViewController.h
//  NestedCollectionView
//
//  Created by Randy Weinstein on 1/27/15.
//  Copyright (c) 2015 CheesefuckDaddy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCollectionViewCell.h"
#import "ContainerView.h"

@interface ViewController : UIViewController
<UICollectionViewDataSource, UICollectionViewDelegate>
@property (strong, nonatomic) NSMutableArray *labels;
@property (strong,nonatomic) NSIndexPath *selectedCell;
@property (strong,nonatomic) MyCollectionViewCell *lastSelectedCell;
@property (weak, nonatomic) IBOutlet UICollectionView *theChanges;
- (IBAction)chordSelected:(id)sender;
- (IBAction)playbackSelected:(id)sender;
@property (weak, nonatomic) IBOutlet ContainerView *containerView;

@end

