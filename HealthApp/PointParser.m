//
//  PointParser.m
//  HealthApp
//
//  Created by 市村有貴江 on 2015/09/12.
//  Copyright (c) 2015年 ichi. All rights reserved.
//

#import "PointParser.h"

@implementation PointParser


- (float)parsePoint{
    
    float mem = self.viewLength/(self.max - self.min);
    
    float end = mem * (self.value - self.min);
    
    if(self.plus){
        return end;
    } else {
        return self.viewLength - end;
    }
    
    return 0;
}
@end
