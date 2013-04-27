//
//  ViewController.m
//  MLDataPickerDemo
//
//  Created by Tyler on 13-4-27.
//  Copyright (c) 2013年 Delaware consulting. All rights reserved.
//

#import "ViewController.h"

#import "MLDataPicker.h"

@interface ViewController () <MLDataPickerDelegate>
{
    NSMutableArray *_maItems;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    _maItems = [NSMutableArray arrayWithObjects:@"Item1", @"Item2", @"Item3", @"Item4", @"Item5", @"Item6", nil];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)actionForDataPicker:(id)sender
{
    MLDataPicker *dpPrivate = [[MLDataPicker alloc] initWithDefaultIndex:0
                                                                   items:_maItems];
    dpPrivate.delegateForML = self;
    
    [dpPrivate showInView:self.view.window];
}

#pragma mark - MLDataPickerDelegate

- (void)handleCompletionForMLDataPicker:(int)pIndex
{
    NSLog(@"%@", _maItems[pIndex]);
}

@end
