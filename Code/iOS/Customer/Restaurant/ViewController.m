//
//  ViewController.m
//  Restaurant
//
//  Created by Asif Memon on 24/04/16.
//  Copyright © 2016 Asif Memon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)handle:(id)sender {
    ViewController *view = [self.storyboard instantiateViewControllerWithIdentifier:@"registrationComplete"];
    if (view)
    {
        //TODO why is this not working and alternative to second one
        //[self.navigationController pushViewController:view animated:YES];
        [self presentModalViewController:view animated:YES];
    }
}

@end
