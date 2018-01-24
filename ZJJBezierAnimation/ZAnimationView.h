//
//  ZAnimationView.h
//  ZJJBezierAnimation
//
//  Created by 张锦江 on 2018/1/24.
//  Copyright © 2018年 ZJJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZAnimationView : UIView

/**type
 0: 直线
 1: 曲线
 2: 抛物线
 3: 圆
 */
- (instancetype)initWithFrame:(CGRect)frame withType:(NSInteger)type;

// 开始动画
- (void)beginBezierAnimation;

@end
