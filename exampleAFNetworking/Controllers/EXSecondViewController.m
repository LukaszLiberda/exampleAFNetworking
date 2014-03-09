//
//  EXSecondViewController.m
//  exampleAFNetworking
//
//  Created by lukasz liberda on 3/9/14.
//  Copyright (c) 2014 example. All rights reserved.
//

#import "EXSecondViewController.h"

@interface EXSecondViewController ()

@end

@implementation EXSecondViewController

- (IBAction)backAction:(UIBarButtonItem *)sender {
//    [self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
}


@end
