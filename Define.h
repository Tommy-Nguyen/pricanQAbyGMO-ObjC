//
//  Define.h
//  BeepBeep
//
//  Created by Nguyen Minh on 6/2/15.
//  Copyright (c) 2015 Nguyen Minh. All rights reserved.
//
#import "AppDelegate.h"

#ifndef PQA_Define_h
#define PQA_Define_h

#define DEVICE_WIDTH            [[[[UIApplication sharedApplication] keyWindow] rootViewController].view convertRect:[[UIScreen mainScreen] bounds] fromView:nil].size.width
#define DEVICE_HEIGHT           [[[[UIApplication sharedApplication] keyWindow] rootViewController].view convertRect:[[UIScreen mainScreen] bounds] fromView:nil].size.height

#define kTitleLoading           @"Loading..."
#define kTimeoutDefault        30

// Loading functions
#define START_LOADING           [[DataManager sharedManager] showLoadingView]
#define STOP_LOADING            [[DataManager sharedManager] hideLoadingView]

//MARCRO
#define APP_DELEGATE ((AppDelegate *)[UIApplication sharedApplication].delegate)
#define FONT_MYRIAD_PRO_SEMIBOLD(s) [NSFont fontWithName: @"MyriadPro-Semibold" size: s]
#define FONT_LATO_BOLD(s) [NSFont fontWithName: @"Lato-Bold" size: s]
#define FONT_OPENSANS_BOLD(s) [NSFont fontWithName: @"OpenSans-Bold" size: s]
#define FONT_OPENSANS_SEMIBOLD(s) [NSFont fontWithName: @"OpenSans-Semibold" size: s]
#define FONT_OPENSANS(s) [NSFont fontWithName: @"OpenSans-Regular" size: s]
#define FONT_DEFAULT(s)[NSFont fontWithName: @"HelveticaNeue" size: s]
#define FONT_DEFAULT_BOLD(s)[NSFont fontWithName: @"HelveticaNeue-Bold" size: s]
#define CLCOORDINATES_EQUAL( coord1, coord2 ) (coord1.latitude == coord2.latitude && coord1.longitude == coord2.longitude)

#endif
