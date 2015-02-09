//
//  ViewController.m
//  ContainmentProto
//
//  Created by Weinstein, Randy - Nick.com on 2/9/15.
//  Copyright (c) 2015 com.sigmonky. All rights reserved.
//

#import "ViewController.h"
#import "ChordViewController.h"
#import "PlaybackController.h"

@interface ViewController ()
@property UIViewController  *currentDataEntryVC;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ChordViewController *chordVC = [self.storyboard instantiateViewControllerWithIdentifier:@"chordEntry"];
    [self presentEntryController:chordVC];
    
    
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
