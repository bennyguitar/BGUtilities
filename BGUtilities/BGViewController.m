//
//  BGViewController.m
//  BGUtilities
//
//  Created by Ben Gordon on 12/11/13.
//  Copyright (c) 2013 Ben Gordon. All rights reserved.
//

#import "BGViewController.h"
#import "BGUtilities.h"

@interface BGViewController ()

@end

@implementation BGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    view.backgroundColor = [UIColor redColor];
    view.alpha = 0;
    [self.view addSubview:view];
    
    [view fadeInWithDuration:2 completion:^(BOOL finished) {
        NSLog(@"Hello");
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
