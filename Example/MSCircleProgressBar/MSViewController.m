//
//  MSViewController.m
//  MSCircleProgressBar
//
//  Created by Nicholas M. Mizoguchi on 09/13/2015.
//  Copyright (c) 2015 Nicholas M. Mizoguchi. All rights reserved.
//

#import "MSViewController.h"
#import <MSCircleProgressBar/MSCircleProgressBar.h>

@interface MSViewController ()
@property (weak, nonatomic) IBOutlet MSCircleProgressBar *circleProgressBar;
@end

@implementation MSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after    loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onRewindPressed:(id)sender {
    [self.circleProgressBar setProgress:self.circleProgressBar.progress-=8.0];
    NSLog(@"Setting progress to %f",_circleProgressBar.progress);
}

- (IBAction)onForwardPressed:(id)sender {
    [self.circleProgressBar setProgress:self.circleProgressBar.progress+=8.0];
    NSLog(@"Setting progress to %f",_circleProgressBar.progress);
}


@end
