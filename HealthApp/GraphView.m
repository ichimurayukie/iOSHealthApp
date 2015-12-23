//
//  GraphView.m
//  HealthApp
//
//  Created by 市村有貴江 on 2015/09/12.
//  Copyright (c) 2015年 ichi. All rights reserved.
//

#import "GraphView.h"
#import "PointDrawer.h"
#import "LineDrawer.h"
#import "PointParser.h"
#import "MyData.h"

@implementation GraphView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    [self drawBaseLine];
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"year = %d AND month = %d AND index = 0", self.mYear , self.mMonth ];
    RLMResults *datas = [MyData objectsWithPredicate:pred];
    
    self.data1Array = (NSMutableArray*)datas;
    
    NSPredicate *predTemp = [NSPredicate predicateWithFormat:@"year = %d AND month = %d AND index = 1", self.mYear , self.mMonth ];
    RLMResults *datasTemp = [MyData objectsWithPredicate:predTemp];
    
    self.data2Array = (NSMutableArray*)datasTemp;
    
    NSMutableArray* pointW = [self getPointFromData:self.data1Array half:YES];
    [self drawGraph:pointW gColor:[UIColor colorWithRed:1.0 green:0.8 blue:1.0 alpha:1.0]];
    
    NSMutableArray* pointWA = [self getPointFromData:self.data1Array half:NO];
    [self drawGraph:pointWA gColor:[UIColor colorWithRed:1.0 green:0.8 blue:1.0 alpha:1.0]];
    
    NSMutableArray* pointH = [self getPointFromData:self.data2Array half:YES];
    [self drawGraph:pointH gColor:[UIColor redColor]];
    
    NSMutableArray* pointHA = [self getPointFromData:self.data2Array half:NO];
    [self drawGraph:pointHA gColor:[UIColor redColor]];
    
}

- (void)showGraph:(NSInteger)year month:(NSInteger)month {
    self.mYear = year;
    self.mMonth = month;
    [self setNeedsDisplay];
}

- (NSMutableArray*) getPointFromData:(NSMutableArray*) datas half:(BOOL)half
{
    
    NSMutableArray *point = [[NSMutableArray alloc]init];
    
    if(datas.count == 0) return point;
    
    float min = ((MyData*)[datas objectAtIndex:0]).mData - 10;
    
    float max = ((MyData*)[datas objectAtIndex:0]).mData + 10;
    
    for(int i = 0; i < datas.count; i++){
        // ポイント表示
        MyData* data = [datas objectAtIndex:i];
        NSInteger day = (NSInteger)data.day;
        
        if(half == YES){
            if(day > 16) break;
        }
        
        if( (half == YES && day <= 16) || (half == NO && day > 16) ){
            PointParser *pp = [[PointParser alloc]init];
        
            if(day <= 16) {
                pp.min = 1;
                pp.max = 16;
            } else {
                pp.min = 16;
                pp.max = 31;
            }
        
            pp.viewLength = self.frame.size.width;
        
            pp.value = (NSInteger)data.day;
            pp.plus = YES;
            float x = [pp parsePoint];
        
            
        
            pp.min = min;
            pp.max = max;
        
            pp.viewLength = self.frame.size.height / 2;
            pp.value = (float)data.mData;
            pp.plus = NO;
            float y = [pp parsePoint];
        
            if(day > 16) {
                y += self.frame.size.height / 2;
            }
        
            CGPoint pt = CGPointMake(x, y);
            NSValue *value = [NSValue valueWithBytes:&pt objCType:@encode(CGPoint)];
        
            [point addObject:value];
        }
        
    }
    
    return point;
}

- (void)drawGraph:(NSMutableArray*)points gColor:(UIColor*)color{
    
    if(points.count == 0) return;
    
    for(int i = 0; i < points.count; i++) {
        PointDrawer *dr = [[PointDrawer alloc] init];
        dr.x = [((NSValue*)[points objectAtIndex:i]) CGPointValue].x;
        dr.y = [((NSValue*)[points objectAtIndex:i]) CGPointValue].y;
        dr.lineWidth = 1;
        dr.color = color;
        dr.radius = 1;
        [dr draw];
    }
    
    for(int i = 0; i < points.count - 1; i++) {
        LineDrawer *ld = [[LineDrawer alloc] init];
        ld.x1 = [((NSValue*)[points objectAtIndex:i]) CGPointValue].x;
        ld.y1 = [((NSValue*)[points objectAtIndex:i]) CGPointValue].y;
        ld.x2 = [((NSValue*)[points objectAtIndex:(i + 1)]) CGPointValue].x;
        ld.y2 = [((NSValue*)[points objectAtIndex:(i + 1)]) CGPointValue].y;
        ld.lineWidth = 1;
        ld.color = color;
        [ld draw];
    }
    
}

- (void)drawBaseLine {
    
    CGFloat y = self.frame.size.height/2;
    
    LineDrawer* lineDrawer = [[LineDrawer alloc]init];
    lineDrawer.x1 = 0;
    lineDrawer.y1 = y;
    lineDrawer.x2 = self.frame.size.width;
    lineDrawer.y2 = y;
    lineDrawer.lineWidth = 1;
    lineDrawer.color = [UIColor whiteColor];
    [lineDrawer draw];
    
}

@end
