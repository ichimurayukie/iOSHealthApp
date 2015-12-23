//
//  PointDrawer.m
//  HealthApp
//
//  Created by 市村有貴江 on 2015/09/12.
//  Copyright (c) 2015年 ichi. All rights reserved.
//

#import "PointDrawer.h"

@implementation PointDrawer

- (bool)draw{
    
    UIBezierPath* arc
    = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.x, self.y) radius:self.radius startAngle:0 endAngle:M_PI*2 clockwise:YES];
    [self.color setStroke];
    arc.lineWidth = self.lineWidth;
    [arc stroke];
    [self.color setFill];
    [arc fill];
    
    return true;
}

@end
