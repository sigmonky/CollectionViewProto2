//
//  ViewController.h
//  ContainmentProto
//
//  Created by Weinstein, Randy - Nick.com on 2/9/15.
//  Copyright (c) 2015 com.sigmonky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContainerView.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet ContainerView *containerView;
- (IBAction)chordSelected:(id)sender;
- (IBAction)playbackSelected:(id)sender;

@end

