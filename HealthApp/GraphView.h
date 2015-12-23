//
//  GraphView.h
//  HealthApp
//
//  Created by 市村有貴江 on 2015/09/12.
//  Copyright (c) 2015年 ichi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GraphView : UIView

// 体重
@property NSMutableArray* data1Array;

// 体温
@property NSMutableArray* data2Array;

@property NSInteger mMonth;

@property NSInteger mYear;

- (void)showGraph:(NSInteger)year month:(NSInteger)month;

@end
