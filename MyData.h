//
//  MyData.h
//  HealthApp
//
//  Created by 市村有貴江 on 2015/09/06.
//  Copyright (c) 2015年 ichi. All rights reserved.
//

#import <Realm/Realm.h>

@interface MyData : RLMObject
@property NSInteger year;
@property NSInteger month;
@property NSInteger day;
@property float mData;
@property NSInteger index;
@property NSString* yobi;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<MyData>
RLM_ARRAY_TYPE(MyData)
