//
//  MLDataPicker.m
//  NewPeek2
//
//  Created by Tyler on 13-4-23.
//  Copyright (c) 2013年 Delaware consulting. All rights reserved.
//

#define kSelectedRowColor [UIColor colorWithRed:12/255.0 green:76/255.0 blue:186/255.0 alpha:1.0]

#import "MLDataPicker.h"

@interface MLDataPicker () <UIPickerViewDelegate, UIPickerViewDataSource>
{
    UIPickerView *_pvItems;
    
    NSMutableArray *_maItems;
    
    int _indexSelected;
}

@end

@implementation MLDataPicker

- (id)initWithDefaultIndex:(int)pIndex
                     items:(NSMutableArray *)pItems
{
    if (self == [super init]) {
        _maItems = pItems;
        
        self.title = @" ";
	
		_pvItems = [[UIPickerView alloc] initWithFrame:CGRectMake(0.0, 44.0, 0.0, 0.0)];
		_pvItems.showsSelectionIndicator = YES;
		_pvItems.dataSource = self;
		_pvItems.delegate = self;
		
		UIToolbar *tooDate = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
		tooDate.barStyle = UIBarStyleBlackTranslucent;
		[tooDate sizeToFit];
		
		NSMutableArray *maBarItems = [[NSMutableArray alloc] init];
        
        UIBarButtonItem *bbiCancel = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                   target:self
                                                                                   action:@selector(handleHide:)];
        
		[maBarItems addObject:bbiCancel];
		
		UIBarButtonItem *bbiFlexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
																					  target:self
																					  action:nil];
		[maBarItems addObject:bbiFlexSpace];
        
        UIBarButtonItem *bbiDone = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                 target:self
                                                                                 action:@selector(handleDone:)];
		[maBarItems addObject:bbiDone];
		
		[tooDate setItems:maBarItems animated:YES];
		
		[self addSubview:tooDate];
		[self addSubview:_pvItems];
        
        _indexSelected = pIndex;
        
        [_pvItems selectRow:pIndex inComponent:0 animated:YES];
        
        UILabel *lblTitle = (UILabel *)[_pvItems viewForRow:pIndex forComponent:0];
        
        lblTitle.textColor = kSelectedRowColor;
    }
    
    return self;
}

- (void)showInView:(UIView *)view
{
    [super showInView:view];
    
    [self setBounds:CGRectMake(0, 0, 320, 475)];
}

- (void)handleDone:(id)sender
{
    if (self.delegateForML != nil && [self.delegateForML respondsToSelector:@selector(handleCompletionForMLDataPicker:)]) {
        [self.delegateForML handleCompletionForMLDataPicker:_indexSelected];
    }
    
    [self dismissWithClickedButtonIndex:0 animated:YES];
}

- (void)handleHide:(id)sender
{
	[self dismissWithClickedButtonIndex:0 animated:YES];
}

#pragma mark - UIPickerViewDataSsource

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	return _maItems.count;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
	UILabel* lblTitle = (UILabel*)view;
    
    if (lblTitle == nil) {
        lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 44)];
		lblTitle.backgroundColor = [UIColor clearColor];
		lblTitle.textAlignment = UITextAlignmentCenter;
		lblTitle.textColor = [UIColor blackColor];
		lblTitle.font = [UIFont boldSystemFontOfSize:24];
    }
    
    lblTitle.text = _maItems[row];
    lblTitle.textColor = [UIColor blackColor];
	
    return lblTitle;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
	return 300;
}

#pragma mark - UIPickerViewDelegate

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
	UILabel *lblOld = (UILabel *)[pickerView viewForRow:_indexSelected forComponent:component];
    lblOld.textColor = [UIColor blackColor];
    
    UILabel *lblNew = (UILabel *)[pickerView viewForRow:row forComponent:component];
    
    lblNew.textColor = kSelectedRowColor;
    
    _indexSelected = row;
}

@end
