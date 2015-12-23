//
//  InputDataViewController.m
//  HealthApp
//
//  Created by 市村有貴江 on 2015/09/06.
//  Copyright (c) 2015年 ichi. All rights reserved.
//

#import "InputDataViewController.h"
#import "MyData.h"
#import "GraphViewController.h"

@interface InputDataViewController ()

@end

@implementation InputDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.inputData.keyboardType = UIKeyboardTypeDecimalPad;
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

- (IBAction)clickSegment:(id)sender {

    if(self.sc.selectedSegmentIndex == 0){
        self.label.text = @"kg";
        self.inputData.text = @"50.0";
    } else {
        self.label.text = @"℃";
        self.inputData.text = @"36.0";
    }
}

- (IBAction)clickSave:(id)sender {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ja"];
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:[NSDate date]];
    
    NSInteger year = [comps year];
    NSInteger month = [comps month];
    NSInteger day = [comps day] + 1;
    NSInteger index = self.sc.selectedSegmentIndex;
                               
    comps = [calendar components:NSWeekdayCalendarUnit fromDate:[NSDate date]];
                               
    NSString* yobi = [NSString stringWithFormat:@"%@",formatter.shortWeekdaySymbols[comps.weekday-1]];
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"year = %d AND month = %d AND day = %d AND index = %d", year, month, day, index ];
    RLMResults *datas = [MyData objectsWithPredicate:pred];
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    
    if([datas count] == 0) {
        
        MyData *myData = [[MyData alloc]init];
    
        myData.mData = self.inputData.text.floatValue;
        myData.index = index;
        myData.year = year;
        myData.month = month;
        myData.day = day;
        myData.yobi = yobi;
        [realm addObject:myData];
        
    } else {
        ((MyData*)[datas objectAtIndex:0]).mData = self.inputData.text.floatValue;
    }
    
    [realm commitWriteTransaction];
    
}




@end
