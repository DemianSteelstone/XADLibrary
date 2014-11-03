//
//  MOPBannerHolder_View.h
//  DLSound
//
//  Created by Kain on 22.08.14.
//  Copyright (c) 2014 Macsoftex. All rights reserved.
//

#import "MOPBannerHolder.h"

@class MDPProviderViewController;

@interface MOPBannerHolder_MDPProviderViewController : MOPBannerHolder
-(id)initWithIdentifier:(NSString*)identifier providerViewController:(MDPProviderViewController *)providerController upgradeNotificationName:(NSString *)notificationName;
@end
