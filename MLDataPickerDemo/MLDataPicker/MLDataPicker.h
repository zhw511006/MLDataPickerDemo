//
//  MLDataPicker.h
//  NewPeek2
//
//  Created by Tyler on 13-4-23.
//  Copyright (c) 2013年 Delaware consulting. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MLDataPickerDelegate <NSObject>

- (void)handleCompletionForMLDataPicker:(int)pIndex;

@end

@interface MLDataPicker : UIActionSheet

@property (nonatomic, weak) id<MLDataPickerDelegate> delegateForML;

- (id)initWithDefaultIndex:(int)pIndex
                     items:(NSMutableArray *)pItems;

@end
