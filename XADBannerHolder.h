//
//  MOPBannerHolder.h
//  OnlinePlayer
//
//  Created by Evgeny Rusanov on 16.05.14.
//  Copyright (c) 2014 Macsoftex. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XADBannerHolder;

@protocol XADBannerHolderDelegate <NSObject>

-(void)willAnimateShowBanner:(XADBannerHolder*)banner;
-(void)willAnimateHideBanner:(XADBannerHolder*)banner;

@end

@interface XADBannerHolder : NSObject

@property (nonatomic,readonly) BOOL bannerLoaded;
@property (nonatomic,strong,readonly) UIView *adView;
@property (nonatomic,weak) id<XADBannerHolderDelegate> delegate;

-(id)initWithIdentifier:(NSString*)identifier rootController:(UIViewController*)rootViewController upgradeNotificationName:(NSString*)notificationName;
-(void)reload;

-(void)updateFrames;

-(void)setFramesForLoadedBanner;
-(void)setFramesForNotLoadedBanner;

-(void)updateToOrientation:(UIInterfaceOrientation)orientation;

-(CGSize)adFrameSize;

@end
