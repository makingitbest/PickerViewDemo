//
//  CustomDatePickerView.h
//  PickerViewDemo
//
//  Created by WangQiao on 16/9/3.
//  Copyright © 2016年 WangQiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CustomDatePickerView;

@protocol CustomDatePickerViewDelegate <NSObject>

/**
 *  CustomDatePickerViewDelegate
 *
 *  @param customDatePickerView customDatePickerView
 *  @param date                 date
 */
- (void)customDatePickerView:(CustomDatePickerView *)customDatePickerView didSelectedDate:(NSDate *)date;

/**
 *  隐藏 customDatePickerView
 *
 *  @param customDatePickerView customDatePickerView
 */
- (void)customDatePickerViewHide:(CustomDatePickerView *)customDatePickerView;

@end

@interface CustomDatePickerView : UIView

@property (nonatomic, weak) id <CustomDatePickerViewDelegate> delegate;

/**
 *  类似于UITextField里面的属性 inputAccessoryView,这里主要设置高度
 */
@property (nonatomic) CGFloat inputAccessoryHeight;

/**
 *  选择日期
 */
@property (nonatomic, strong) NSDate *selectedDate;

/**
 *  显示pickerView
 *
 *  @param configBlock block方法,将定制传出去,方便外面设置
 */
- (void)showPickerViewAndConfigInputAccessoryView:(void (^)(CustomDatePickerView *pickerView, UIView *inputAccessoryView))configBlock;

/**
 *  pickerView的隐藏
 */
- (void)hidePickerView;

@end
