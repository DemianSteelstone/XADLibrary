//
//  MOPBannerHolder_ViewControllerWithMainScrollView.m
//  photoexplorer
//
//  Created by Evgeny Rusanov on 30.10.14.
//  Copyright (c) 2014 Evgeny Rusanov. All rights reserved.
//

#import "XADBannerHolder_ViewControllerWithMainScrollView.h"

@implementation XADBannerHolder_ViewControllerWithMainScrollView
{
    __weak UIScrollView *_scrollView;
}

-(id)initWithIdentifier:(NSString *)identifier rootController:(UIViewController *)rootViewController upgradeNotificationName:(NSString *)notificationName scrollView:(UIScrollView*)scrollView
{
    if (self = [super initWithIdentifier:identifier rootController:rootViewController upgradeNotificationName:notificationName])
    {
        _scrollView = scrollView;
    }
    return self;
}

-(void)setFramesForLoadedBanner
{
    [super setFramesForLoadedBanner];
    
    _scrollView.contentInset = UIEdgeInsetsMake(0, 0, self.adView.frame.size.height, 0);
}

-(void)setFramesForNotLoadedBanner
{
    [super setFramesForNotLoadedBanner];
    
    _scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
}

@end
