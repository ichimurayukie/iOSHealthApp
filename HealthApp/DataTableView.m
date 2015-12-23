//
//  DataTableView.m
//  ichimura
//
//  Created by 市村 有貴江 on 2015/09/25.
//  Copyright © 2015年 市村 有貴江. All rights reserved.
//

#import "DataTableView.h"
#import "MyData.h"

@implementation DataTableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
    label.text = @"日付";
    label.textColor = [UIColor whiteColor];
    [self addSubview:label];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(200, 0, 320, 100)];
    label2.text = self.title;
    label2.textColor = [UIColor whiteColor];
    [self addSubview:label2];
    
    NSUInteger maxCount = self.datas.count;
    
    if(maxCount > 10) {
        maxCount = 10;
    }
    
    for(int i = 1; i <=maxCount; i++){
        
        MyData *data1 = (MyData*)[self.datas objectAtIndex:(i - 1)];
        NSString* dateStr = [NSString stringWithFormat:@"%ld月%ld日(%@)", (long)data1.month, (long)data1.day, data1.yobi];
        
        int sn = 30;
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, i*sn, 320, 100)];
        label.text = dateStr;
        label.textColor = [UIColor whiteColor];
        [self addSubview:label];
    
        UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(200, i*sn, 320, 100)];
        label2.text = [NSString stringWithFormat : @"%.2f", data1.mData];
        label2.textColor = [UIColor colorWithRed:0.933 green:0.51 blue:0.933 alpha:1.0];
        [self addSubview:label2];
        
        UIBezierPath *line = [UIBezierPath bezierPath];
        
        // 起点
        [line moveToPoint:CGPointMake(0, 60)];
        [line addLineToPoint:CGPointMake(0,60 + i * sn)];
        [line addLineToPoint:CGPointMake(rect.size.width,60 + i * sn)];
        [line addLineToPoint:CGPointMake(rect.size.width,60)];
        
        // 色の設定
        [[UIColor whiteColor] setStroke];
        // ライン幅
        line.lineWidth = 1;
        // 描画
        [line stroke];
    }
    
    // UIBezierPath のインスタンス生成
    UIBezierPath *line = [UIBezierPath bezierPath];
    
    // 起点
    [line moveToPoint:CGPointMake(0, 40)];
    
    // 帰着点
    [line addLineToPoint:CGPointMake(rect.size.width,40)];
    
    [line addLineToPoint:CGPointMake(rect.size.width,60)];
    [line addLineToPoint:CGPointMake(0,60)];
    [line addLineToPoint:CGPointMake(0,40)];
    
    // 色の設定
    [[UIColor whiteColor] setStroke];
    // ライン幅
    line.lineWidth = 1;
    // 描画
    [line stroke];
    
}

- (void) drawDataTableView: (NSString*)title datas:(NSMutableArray*)datas{    self.title = title;
    self.datas = datas;
    
    for (UIView *view in [self subviews]) {
        [view removeFromSuperview];
    }
    [self setNeedsDisplay];
}

@end
