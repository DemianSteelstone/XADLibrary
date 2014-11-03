//
//  MOPBannerHolder_ViewController.m
//  OnlinePlayer
//
//  Created by Evgeny Rusanov on 16.05.14.
//  Copyright (c) 2014 Macsoftex. All rights reserved.
//

#import "XADBannerHolder_ViewController.h"

@implementation XADBannerHolder_ViewController
{
    __weak UIViewController *_adViewController;
}

-(id)initWithIdentifier:(NSString *)identifier rootController:(UIViewController *)rootViewController upgradeNotificationName:(NSString *)notificationName
{
    if (self = [super initWithIdentifier:identifier rootController:rootViewController upgradeNotificationName:notificationName])
    {
        _adViewController = rootViewController;
        
        [_adViewController.view addSubview:self.adView];
    }
    
    return self;
}

-(void)setFramesForLoadedBanner
{
    CGRect bannerRect = self.adView.frame;
    
    bannerRect.origin.x = (CGRectGetWidth(_adViewController.view.frame) - CGRectGetWidth(bannerRect))*0.5;
    bannerRect.origin.y = _adViewController.view.bounds.size.height - bannerRect.size.height;
    self.adView.frame = bannerRect;
}

-(void)setFramesForNotLoadedBanner
{
    CGRect r = self.adView.frame;
    r.origin.x = (CGRectGetWidth(_adViewController.view.bounds) - CGRectGetWidth(r))*0.5;
    r.origin.y = _adViewController.view.bounds.size.height;
    self.adView.frame = r;
}

@end
