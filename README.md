What is MLDataPicker?
---
It's a data picker base on ActionSheet for iPhone.

ARC
---
Fully ARC compatible now

How to use:
---

**Init**

    MLDataPicker *dpPrivate = [[MLDataPicker alloc] initWithDefaultIndex:0
                                                                   items:_maItems];
    dpPrivate.delegateForML = self;
    
    [dpPrivate showInView:self.view.window];
    
**Delegate**

    - (void)handleCompletionForMLDataPicker:(int)pIndex
    {
        NSLog(@"%@", _maItems[pIndex]);
    }

