What is MLDataPicker?
---
It's a data picker base on ActionSheet for iPhone.

<img src="https://www.dropbox.com/s/s0hygnsjbkhcs5v/MLDataPicker.png" />

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

