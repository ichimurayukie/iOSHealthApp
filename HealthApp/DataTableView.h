//
//  DataTableView.h
//  ichimura
//
//  Created by 市村 有貴江 on 2015/09/25.
//  Copyright © 2015年 市村 有貴江. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataTableView : UIView

// データ
@property NSMutableArray* datas;

// タイトル
@property NSString* title;


- (void) drawDataTableView: (NSString*)title datas:(NSMutableArray*)datas;

@end
