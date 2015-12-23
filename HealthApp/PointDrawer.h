//
//  PointDrawer.h
//  HealthApp
//
//  Created by 市村有貴江 on 2015/09/12.
//  Copyright (c) 2015年 ichi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Drawer.h"

@import CoreGraphics;
@import UIKit;

@interface PointDrawer : Drawer

@property CGFloat x;
@property CGFloat y;
@property float radius;
@property BOOL fill;


@end
