//
//  MOPBannerHolder_View.m
//  DLSound
//
//  Created by Kain on 22.08.14.
//  Copyright (c) 2014 Macsoftex. All rights reserved.
//

#import "MOPBannerHolder_MDPProviderViewController.h"
#import "MDPProviderViewController.h"

@implementation MOPBannerHolder_MDPProviderViewController
{
    __weak MDPProviderViewController *_providerController;
}

-(id)initWithIdentifier:(NSString *)identifier rootController:(UIViewController *)rootViewController upgradeNotificationName:(NSString *)notificationName
{
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

-(id)initWithIdentifier:(NSString*)identifier providerViewController:(MDPProviderViewController *)providerController upgradeNotificationName:(NSString *)notificationName
{
    if (self = [super initWithIdentifier:identifier rootController:providerController upgradeNotificationName:notificationName])
    {
        _providerController = providerController;
        _providerController.view.backgroundColor = [UIColor whiteColor];
        [_providerController.view addSubview:self.adView];
    }
    
    return self;
}

-(void)setFramesForLoadedBanner
{
    CGRect bannerRect = self.adView.frame;
    
    bannerRect.origin.x = (CGRectGetWidth(_providerController.view.frame) - CGRectGetWidth(bannerRect))*0.5;
    bannerRect.origin.y = 0;
    self.adView.frame = bannerRect;
    
    CGRect frame = _providerController.contentView.bounds;
    frame.origin.y = bannerRect.size.height;
    frame.size.height = _providerController.view.frame.size.height - bannerRect.size.height;
    _providerController.contentView.frame = frame;
}

-(void)setFramesForNotLoadedBanner
{
    CGRect r = self.adView.frame;
    r.origin.x = (CGRectGetWidth(_providerController.view.bounds) - CGRectGetWidth(r))*0.5;
    r.origin.y = -r.size.height;
    self.adView.frame = r;
    
    _providerController.contentView.frame = _providerController.view.bounds;
}

@end
