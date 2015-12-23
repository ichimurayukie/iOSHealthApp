//
//  DataTableViewController.m
//  HealthApp
//
//  Created by 市村 有貴江 on 2015/12/09.
//  Copyright © 2015年 ichi. All rights reserved.
//

#import "DataTableViewController.h"
#import "MyData.h"

@implementation DataTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.page = 1;
    self.index = 0;
    self.mMonth.keyboardType = UIKeyboardTypeNumberPad;
    self.mYear.keyboardType = UIKeyboardTypeNumberPad;
    
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps;
    
    // 年月日をとりだす
    comps = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit)
                        fromDate:now];
    NSInteger year = [comps year];
    NSInteger month = [comps month];
    
    [self.mYear setText:[NSString stringWithFormat:@"%ld", (long)year]];
    [self.mMonth setText:[NSString stringWithFormat:@"%ld", (long)month]];
    
    [self setDataToTable:self.mChangeIndexBtn.titleLabel.text];
    
}
- (IBAction)clickCIBtn:(id)sender {
    if([self.mChangeIndexBtn.titleLabel.text isEqualToString:@"体重"]){
        [self.mChangeIndexBtn setTitle:@"体温" forState:UIControlStateNormal];
        self.index = 1;
        [self setDataToTable:@"体温"];
    } else {
        [self.mChangeIndexBtn setTitle:@"体重" forState:UIControlStateNormal];
        self.index = 0;
        [self setDataToTable:@"体重"];
    }
    
}

- (IBAction)clickPagePrev:(id)sender {
    self.page--;
    if(self.page < 1) self.page = 1;
    [self setDataToTable:self.mChangeIndexBtn.titleLabel.text];
}

- (IBAction)clickPageNext:(id)sender {
    self.page++;
    if(self.page > 3) self.page = 3;
    [self setDataToTable:self.mChangeIndexBtn.titleLabel.text];
}

- (IBAction)showDataTable:(id)sender {
    [self.view endEditing:YES];
    [self setDataToTable:self.mChangeIndexBtn.titleLabel.text];
}

- (void)setDataToTable :(NSString*)title{
    NSArray *predArray = [NSArray arrayWithObjects:@"year = %d AND month = %d AND index = %d",
                          @"year = %d AND month = %d AND index = %d AND day > 10",
                          @"year = %d AND month = %d AND index = %d AND day > 20",
                          nil];
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:[predArray objectAtIndex:(self.page - 1)], self.mYear.text.integerValue , self.mMonth.text.integerValue, self.index ];
    RLMResults *datas = [MyData objectsWithPredicate:pred];
    
    
    [self.mDT drawDataTableView: title datas:(NSMutableArray*)datas];

}
@end
