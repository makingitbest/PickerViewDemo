//
//  ViewController.m
//  PickerViewDemo
//
//  Created by WangQiao on 16/9/3.
//  Copyright © 2016年 WangQiao. All rights reserved.
//

#import "ViewController.h"
#import "CustomDatePickerView.h"
#import "UIView+SetRect.h"

@interface ViewController ()<CustomDatePickerViewDelegate>

@property (nonatomic, strong) UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];

    self.button = [[UIButton alloc] initWithFrame:self.view.bounds];
    [self.button setTitle:@"我是按钮,占据全屏幕,点我调出UIDatePicker" forState:UIControlStateNormal];
    self.button.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button];
}

- (void)buttonClicked:(UIButton *)button {
    
    CustomDatePickerView *pickerView = [CustomDatePickerView new];
    pickerView.inputAccessoryHeight  = 60;
    pickerView.delegate              = self;
    
    [pickerView showPickerViewAndConfigInputAccessoryView:^(CustomDatePickerView *pickerView, UIView *inputAccessoryView) {
    
        UIButton *button         = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 80,40 )];
        button.layer.borderWidth = 1;
        [button setTitle:@"取消" forState:UIControlStateNormal];
        [button addTarget:pickerView action:@selector(hidePickerView) forControlEvents:UIControlEventTouchUpInside];
        [inputAccessoryView addSubview:button];
    }];
}

- (void)customDatePickerView:(CustomDatePickerView *)customDatePickerView didSelectedDate:(NSDate *)date {

    NSLog(@"%@",date);
}

- (void)customDatePickerViewHide:(CustomDatePickerView *)customDatePickerView {

    NSLog(@"%@",customDatePickerView.selectedDate);
}

@end
