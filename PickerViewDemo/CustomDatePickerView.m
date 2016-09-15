//
//  CustomDatePickerView.m
//  PickerViewDemo
//
//  Created by WangQiao on 16/9/3.
//  Copyright © 2016年 WangQiao. All rights reserved.
//

#import "CustomDatePickerView.h"
#import "UIView+SetRect.h"

@interface CustomDatePickerView ()

@property (nonatomic, strong) UIView       *contentView;
@property (nonatomic, strong) UIButton     *backgroundButton;
@property (nonatomic, strong) UIDatePicker *datePicker;
@property (nonatomic, strong) UIView       *inputAccessoryView;

@end

@implementation CustomDatePickerView

- (instancetype)initWithFrame:(CGRect)frame
{
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;

    self = [super initWithFrame:window.bounds];
    
    if (self) {
        
        self.inputAccessoryHeight = 50;
        
        self.backgroundButton                 = [[UIButton alloc] initWithFrame:window.bounds];
        self.backgroundButton.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
        self.backgroundButton.alpha           = 0;
        [self.backgroundButton addTarget:self action:@selector(hidePickerView) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.backgroundButton];
        
        self.contentView                 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Width, 300)];
        [self addSubview:self.contentView];
        
        self.inputAccessoryView                   = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Width, 0)];
        self.inputAccessoryView.layer.borderWidth = 1;
        [self.contentView addSubview:self.inputAccessoryView];
        
        self.datePicker = [[UIDatePicker alloc] init];
        [self.datePicker addTarget:self action:@selector(datePickerEvent:) forControlEvents:UIControlEventValueChanged];
        [self.contentView addSubview:self.datePicker];

    }
    
    return self;
}

- (void)datePickerEvent:(UIDatePicker *)datePicker {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(customDatePickerView:didSelectedDate:)]) {
        
        [self.delegate customDatePickerView:self didSelectedDate:datePicker.date];
    }
}

- (void)showPickerViewAndConfigInputAccessoryView:(void (^)(CustomDatePickerView *pickerView, UIView *inputAccessoryView))configBlock {

    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self];

    self.inputAccessoryView.height = self.inputAccessoryHeight;
    
    if (configBlock) {
        
        configBlock(self,self.inputAccessoryView);
    }
    
    self.datePicker.top   = self.inputAccessoryView.height;
    self.datePicker.width = Width;
    
    self.contentView.height = self.inputAccessoryView.height + self.datePicker.height;
    self.contentView.top    = Height;
    
    [UIView animateWithDuration:0.35 animations:^{
        
        self.backgroundButton.alpha = 1;
        self.contentView.bottom     = Height;
    }];
}

- (void)hidePickerView {
    
    [UIView animateWithDuration:0.35 animations:^{
        
        self.backgroundButton.alpha = 0;
        self.contentView.top        = Height;
        
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
    }];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(customDatePickerViewHide:)]) {
        
        [self.delegate customDatePickerViewHide:self];
    }
}

// 这是getter方法的实现

- (NSDate *)selectedDate {

    return self.datePicker.date;
}

@end
