//
//  MOPBannerHolder_TableViewController.m
//  OnlinePlayer
//
//  Created by Evgeny Rusanov on 16.05.14.
//  Copyright (c) 2014 Macsoftex. All rights reserved.
//

#import "XADBannerHolder_TableViewController.h"

#import "UITableViewController+XADPrivate.h"

#import <objc/runtime.h>

@implementation XADBannerHolder_TableViewController
{
    __weak UITableViewController *_tableViewController;
}

-(id)initWithIdentifier:(NSString *)identifier rootController:(UIViewController *)rootViewController upgradeNotificationName:(NSString *)notificationName
{
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

-(id)initWithIdentifier:(NSString*)identifier tableViewController:(UITableViewController*)tableViewController upgradeNotificationName:(NSString*)notificationName
{
    if (self = [super initWithIdentifier:identifier rootController:tableViewController upgradeNotificationName:notificationName])
    {
        _tableViewController = tableViewController;
        
        UITableView *t = tableViewController.tableView;
        
        UIView *v = [[UIView alloc] initWithFrame:t.bounds];
        v.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"navbar.png"]];
        v.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        tableViewController.view = v;
        
        t.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleTopMargin;
        t.frame = v.bounds;
        [tableViewController.view addSubview:t];
        objc_setAssociatedObject(tableViewController, XADTableViewKey, t, OBJC_ASSOCIATION_ASSIGN);
        
        [v addSubview:self.adView];
    }
    
    return self;
}

-(void)setFramesForLoadedBanner
{
    CGRect bannerRect = self.adView.frame;
    
    UIEdgeInsets inset = _tableViewController.tableView.contentInset;
    inset.bottom = bannerRect.size.height;
    
    bannerRect.origin.x = (CGRectGetWidth(_tableViewController.view.frame) - CGRectGetWidth(bannerRect))*0.5;
    bannerRect.origin.y = _tableViewController.view.bounds.size.height - bannerRect.size.height;
    
    _tableViewController.tableView.contentInset = inset;
    self.adView.frame = bannerRect;
}

-(void)setFramesForNotLoadedBanner
{
    CGRect r = self.adView.frame;
    r.origin.x = (CGRectGetWidth(_tableViewController.view.bounds) - CGRectGetWidth(r))*0.5;
    r.origin.y = _tableViewController.view.bounds.size.height;
    self.adView.frame = r;
    
    UIEdgeInsets inset = _tableViewController.tableView.contentInset;
    inset.bottom = 0;
    _tableViewController.tableView.contentInset = inset;
    
    _tableViewController.tableView.frame = _tableViewController.view.bounds;
}

@end
