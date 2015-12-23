//
//  GraphViewController.m
//  HealthApp
//
//  Created by 市村有貴江 on 2015/09/06.
//  Copyright (c) 2015年 ichi. All rights reserved.
//

#import "GraphViewController.h"

@interface GraphViewController ()

@end

@implementation GraphViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    
    [self.mGraphView showGraph:year month:month];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)clickShow:(id)sender {
    NSInteger year = [self.mYear.text integerValue];
    NSInteger month = [self.mMonth.text integerValue];
    [self.mGraphView showGraph:year month:month];
}
@end
