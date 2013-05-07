What is MLDataPicker?
---
It's a data picker base on ActionSheet for iPhone.

<img src="https://fgfarq.bn1.livefilestore.com/y2p7JPiYEAjuC4jLoZ6L7CqPoZp4l_MWA8FOkZvzjVyfQRSofAIITaQXRm5h3ywh8jss_Vui_N0eknxs-OeoZKaMNFSLQDagh3yvzLP3cNFIlZoIa24SXcPnmCKdkbBwGb5/MLDataPicker.png?psid=1" />

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

