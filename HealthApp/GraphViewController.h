//
//  GraphViewController.h
//  HealthApp
//
//  Created by 市村有貴江 on 2015/09/06.
//  Copyright (c) 2015年 ichi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GraphView.h"

@interface GraphViewController : UIViewController

@property (weak, nonatomic) IBOutlet GraphView *mGraphView;
@property (weak, nonatomic) IBOutlet UITextField *mYear;
@property (weak, nonatomic) IBOutlet UITextField *mMonth;

- (IBAction)clickShow:(id)sender;

@end
