//
//  Drawer.h
//  HealthApp
//
//  Created by 市村有貴江 on 2015/09/12.
//  Copyright (c) 2015年 ichi. All rights reserved.
//

#import <Foundation/Foundation.h>

@import UIKit;

@interface Drawer : NSObject

@property NSInteger lineWidth;
@property UIColor* color;

-(bool)draw;

@end
