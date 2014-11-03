//
//  MOPBannerHolder_CollectionViewController.m
//  photomovie
//
//  Created by Evgeny Rusanov on 18.05.14.
//  Copyright (c) 2014 Macsoftex. All rights reserved.
//

#import "XADBannerHolder_CollectionViewController.h"

#import "UICollectionViewController+XADPrivate.h"
#import <objc/runtime.h>

@implementation XADBannerHolder_CollectionViewController
{
    __weak UICollectionViewController *_collectionViewController;
}

-(id)initWithIdentifier:(NSString *)identifier rootController:(UIViewController *)rootViewController upgradeNotificationName:(NSString *)notificationName
{
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

-(id)initWithIdentifier:(NSString*)identifier collectionViewController:(UICollectionViewController*)collectionViewController upgradeNotificationName:(NSString*)notificationName
{
    if (self = [super initWithIdentifier:identifier rootController:collectionViewController upgradeNotificationName:notificationName])
    {
        _collectionViewController = collectionViewController;
        
        UICollectionView *collectionView = collectionViewController.collectionView;
        
        UIView *v = [[UIView alloc] initWithFrame:collectionView.bounds];
        v.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"navbar.png"]];
        v.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        _collectionViewController.view = v;
        
        collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        collectionView.frame = v.bounds;
        [_collectionViewController.view addSubview:collectionView];
        objc_setAssociatedObject(collectionView, XADCollectionViewKey, collectionView, OBJC_ASSOCIATION_ASSIGN);
        
        [v addSubview:self.adView];
    }
    
    return self;
}

-(void)setFramesForLoadedBanner
{
    CGRect bannerRect = self.adView.frame;
    
    UIEdgeInsets inset = _collectionViewController.collectionView.contentInset;
    inset.bottom = bannerRect.size.height;
    _collectionViewController.collectionView.contentInset = inset;
    
    bannerRect.origin.x = (CGRectGetWidth(_collectionViewController.view.frame) - CGRectGetWidth(bannerRect))*0.5;
    bannerRect.origin.y = _collectionViewController.view.frame.size.height - bannerRect.size.height;
    self.adView.frame = bannerRect;
}

-(void)setFramesForNotLoadedBanner
{
    CGRect r = self.adView.frame;
    r.origin.x = (CGRectGetWidth(_collectionViewController.view.bounds) - CGRectGetWidth(r))*0.5;
    r.origin.y = _collectionViewController.view.frame.size.height;
    self.adView.frame = r;
    
    UIEdgeInsets inset = _collectionViewController.collectionView.contentInset;
    inset.bottom = 0;
    _collectionViewController.collectionView.contentInset = inset;
}


@end
