//
//  MOPBannerHolder.m
//  OnlinePlayer
//
//  Created by Evgeny Rusanov on 16.05.14.
//  Copyright (c) 2014 Macsoftex. All rights reserved.
//

#import "XADBannerHolder.h"

#import <GoogleMobileAds/GoogleMobileAds.h>

@interface XADBannerHolder () <GADBannerViewDelegate>

@end

@implementation XADBannerHolder
{
    GADBannerView *_banner;
}

-(id)initWithIdentifier:(NSString*)identifier rootController:(UIViewController*)rootViewController upgradeNotificationName:(NSString*)notificationName
{
    if (self = [super init])
    {
        _banner = [[GADBannerView alloc] initWithAdSize:[self adSize:[UIApplication sharedApplication].statusBarOrientation]];
        _banner.adUnitID = identifier;
        _banner.delegate = self;
        _banner.rootViewController = rootViewController;
        
        _banner.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
        
        [self addUpgradeNotification:notificationName];
    }
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(UIView*)adView
{
    return _banner;
}

-(GADAdSize)adSize:(UIInterfaceOrientation)orientation
{
    if (UIInterfaceOrientationIsLandscape(orientation))
        return kGADAdSizeSmartBannerLandscape;
    else
        return kGADAdSizeSmartBannerPortrait;
}

-(void)reload
{
    GADRequest *request = [GADRequest request];
    request.testDevices = [NSArray arrayWithObjects:kGADSimulatorID, nil];
    [_banner loadRequest:request];
}

-(CGSize)adFrameSize
{
    GADAdSize size = _banner.adSize;
    return CGSizeFromGADAdSize(size);
}

-(void)updateBannerSize
{
    CGRect frame = _banner.frame;
    frame.size = [self adFrameSize];
    frame.size.width = _banner.rootViewController.view.bounds.size.width;
    _banner.frame = frame;
}

-(void)updateFrames
{
    if (_banner)
    {
        [self updateBannerSize];
        
        if ([self bannerLoaded])
            [self setFramesForLoadedBanner];
        else
            [self setFramesForNotLoadedBanner];
    }
}

-(void)updateToOrientation:(UIInterfaceOrientation)orientation
{
    if (_banner)
    {
        _banner.adSize = [self adSize:orientation];
        [self updateFrames];
    }
}

-(void)addUpgradeNotification:(NSString*)notificationName
{
    if (notificationName.length)
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(upgradeCompleteMessage:)
                                                     name:notificationName
                                                   object:nil];
}

-(void)removeAdBanner
{
    
    UIView *bannerView = _banner;
    _banner = nil;
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         [self setFramesForNotLoadedBanner];
                     } completion:^(BOOL finished) {
                         [bannerView removeFromSuperview];
                     }];
}

-(void)upgradeCompleteMessage:(NSNotification*)n
{
    [self removeAdBanner];
}

-(void)setFramesForLoadedBanner
{
    [self doesNotRecognizeSelector:_cmd];
}

-(void)setFramesForNotLoadedBanner
{
    [self doesNotRecognizeSelector:_cmd];
}

#pragma mark - GADDelegate

- (void)adViewDidReceiveAd:(GADBannerView *)bannerView
{
    [self updateBannerSize];
    _bannerLoaded = YES;
    
    [bannerView.superview bringSubviewToFront:bannerView];

    [UIView animateWithDuration:0.3
                     animations:^{
                         [self willShowAnimated];
                         [self setFramesForLoadedBanner];
                     }];
}

-(void)willShowAnimated
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(willAnimateShowBanner:)])
    {
        [self.delegate willAnimateShowBanner:self];
    }
}

-(void)willHideAnimated
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(willAnimateHideBanner:)])
    {
        [self.delegate willAnimateHideBanner:self];
    }
}

- (void)adView:(GADBannerView *)bannerView
didFailToReceiveAdWithError:(GADRequestError *)error
{
    _bannerLoaded = NO;
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         [self willHideAnimated];
                         [self setFramesForNotLoadedBanner];
                     }];
}

@end
