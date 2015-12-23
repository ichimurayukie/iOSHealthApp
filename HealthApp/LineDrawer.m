//
//  LinwDrawer.m
//  HealthApp
//
//  Created by 市村有貴江 on 2015/09/12.
//  Copyright (c) 2015年 ichi. All rights reserved.
//

#import "LineDrawer.h"


@implementation LineDrawer

-(bool)draw{
    UIBezierPath *line = [UIBezierPath bezierPath];
    [line moveToPoint:CGPointMake(self.x1, self.y1)];
    [line addLineToPoint:CGPointMake(self.x2, self.y2)];
    [self.color setStroke];
    line.lineWidth = self.lineWidth;
    [line stroke];
    return true;
}
@end
