//
//  UITableViewController+AdSupport.m
//  VideoDownloader
//
//  Created by Evgeny Rusanov on 26.10.12.
//  Copyright (c) 2012 Kain. All rights reserved.
//

#import "UITableViewController+XADPrivate.h"
#import <QuartzCore/QuartzCore.h>

#import <objc/runtime.h>

const void *XADTableViewKey = &XADTableViewKey;

@implementation UITableViewController (XADPrivate)

-(UITableView*)tableView
{
    if ([self.view isKindOfClass:[UITableView class]])
        return (UITableView*)[self view];
    
    UITableView *table = objc_getAssociatedObject(self, XADTableViewKey);
    
    return table;
}

@end
