//
//  InputDataViewController.h
//  HealthApp
//
//  Created by 市村有貴江 on 2015/09/06.
//  Copyright (c) 2015年 ichi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InputDataViewController : UIViewController


@property (weak, nonatomic) IBOutlet UISegmentedControl *sc;
@property (weak, nonatomic) IBOutlet UITextField *inputData;
@property (weak, nonatomic) IBOutlet UILabel *label;

- (IBAction)clickSave:(id)sender;
- (IBAction)clickSegment:(id)sender;

@end
