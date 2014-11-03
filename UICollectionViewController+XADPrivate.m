//
//  UICollectionViewController+MOPAdSupport.m
//  photomovie
//
//  Created by Evgeny Rusanov on 18.05.14.
//  Copyright (c) 2014 Macsoftex. All rights reserved.
//

#import "UICollectionViewController+XADPrivate.h"

#import <objc/runtime.h>

const void *XADCollectionViewKey = &XADCollectionViewKey;

@implementation UICollectionViewController (XADPrivate)

-(UICollectionView*)collectionView
{
    if ([self.view isKindOfClass:[UICollectionView class]])
        return (UICollectionView*)[self view];
    
    UICollectionView *collectionView = objc_getAssociatedObject(self, XADCollectionViewKey);
    
    return collectionView;
}

@end
