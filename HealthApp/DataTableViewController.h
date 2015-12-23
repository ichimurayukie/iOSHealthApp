//
//  DataTableViewController.h
//  HealthApp
//
//  Created by 市村 有貴江 on 2015/12/09.
//  Copyright © 2015年 ichi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataTableView.h"

@interface DataTableViewController : UIViewController


@property (weak, nonatomic) IBOutlet DataTableView *mDT;
@property (weak, nonatomic) IBOutlet UIButton *mChangeIndexBtn;
@property NSInteger page;
@property NSInteger index;
@property (weak, nonatomic) IBOutlet UITextField *mYear;
@property (weak, nonatomic) IBOutlet UITextField *mMonth;

- (IBAction)clickCIBtn:(id)sender;
- (IBAction)clickPagePrev:(id)sender;
- (IBAction)clickPageNext:(id)sender;
- (IBAction)showDataTable:(id)sender;
- (void)setDataToTable:(NSString*)title;
@end
