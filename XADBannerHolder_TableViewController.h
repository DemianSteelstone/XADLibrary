//
//  MOPBannerHolder_TableViewController.h
//  OnlinePlayer
//
//  Created by Evgeny Rusanov on 16.05.14.
//  Copyright (c) 2014 Macsoftex. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "XADBannerHolder.h"

@interface XADBannerHolder_TableViewController : XADBannerHolder

-(id)initWithIdentifier:(NSString*)identifier tableViewController:(UITableViewController*)tableViewController upgradeNotificationName:(NSString*)notificationName;

@end
