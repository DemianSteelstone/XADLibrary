//
//  MOPBannerHolder_ViewControllerWithMainScrollView.h
//  photoexplorer
//
//  Created by Evgeny Rusanov on 30.10.14.
//  Copyright (c) 2014 Evgeny Rusanov. All rights reserved.
//

#import "XADBannerHolder_ViewController.h"

@interface XADBannerHolder_ViewControllerWithMainScrollView : XADBannerHolder_ViewController

-(id)initWithIdentifier:(NSString *)identifier rootController:(UIViewController *)rootViewController upgradeNotificationName:(NSString *)notificationName scrollView:(UIScrollView*)scrollView;

@end
