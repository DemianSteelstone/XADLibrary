//
//  MOPBannerHolder_CollectionViewController.h
//  photomovie
//
//  Created by Evgeny Rusanov on 18.05.14.
//  Copyright (c) 2014 Macsoftex. All rights reserved.
//

#import "XADBannerHolder.h"

@interface XADBannerHolder_CollectionViewController : XADBannerHolder

-(id)initWithIdentifier:(NSString*)identifier collectionViewController:(UICollectionViewController*)collectionViewController upgradeNotificationName:(NSString*)notificationName;

@end
