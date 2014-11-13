//
//  MOPBannerHolder.h
//  OnlinePlayer
//
//  Created by Evgeny Rusanov on 16.05.14.
//  Copyright (c) 2014 Macsoftex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XADBannerHolder : NSObject

@property (nonatomic,readonly) BOOL bannerLoaded;
@property (nonatomic,strong,readonly) UIView *adView;

-(id)initWithIdentifier:(NSString*)identifier rootController:(UIViewController*)rootViewController upgradeNotificationName:(NSString*)notificationName;
-(void)reload;

-(void)updateFrames;

-(void)setFramesForLoadedBanner;
-(void)setFramesForNotLoadedBanner;

@end
