//
//  ZAnimationView.m
//  ZJJBezierAnimation
//
//  Created by 张锦江 on 2018/1/24.
//  Copyright © 2018年 ZJJ. All rights reserved.
//

#import "ZAnimationView.h"

@interface ZAnimationView () <CAAnimationDelegate> {
    UIView *_animationView;
    CAKeyframeAnimation *_animation;
}

@end

@implementation ZAnimationView

- (instancetype)initWithFrame:(CGRect)frame withType:(NSInteger)type {
    self = [super initWithFrame:frame];
    if (self) {
        if (type == 0) {
            [self creatLineBezierPath];
        }else if (type == 1) {
            [self creatCurveBezierPath];
        }else if (type == 2) {
            [self creatQuadCurveBezierPath];
        }else {
            [self creatArcBezierPath];
        }
    }
    return self;
}

#pragma mark - 直线
- (void)creatLineBezierPath {
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    bezierPath.lineWidth = 2.f;
    [bezierPath moveToPoint:CGPointMake(10, 20)];
    [bezierPath addLineToPoint:CGPointMake(300, 300)];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = bezierPath.CGPath;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.strokeColor = [UIColor yellowColor].CGColor;
    [self.layer addSublayer:layer];
    
    _animation = [CAKeyframeAnimation animation];
    _animation.keyPath = @"position";
    _animation.duration = 2;
    _animation.delegate = self;
    _animation.path = bezierPath.CGPath;
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(10, 20)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(300, 300)];
    _animation.values = @[value1, value2];
}

#pragma mark - 曲线
- (void)creatCurveBezierPath {
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    bezierPath.lineWidth = 2.f;
    [bezierPath moveToPoint:CGPointMake(10, 20)];
    [bezierPath addCurveToPoint:CGPointMake(300, 300) controlPoint1:CGPointMake(100, 500) controlPoint2:CGPointMake(200, 0)];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = bezierPath.CGPath;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.strokeColor = [UIColor yellowColor].CGColor;
    [self.layer addSublayer:layer];
    
    _animation = [CAKeyframeAnimation animation];
    _animation.keyPath = @"position";
    _animation.duration = 2;
    _animation.delegate = self;
    _animation.path = bezierPath.CGPath;
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(10, 20)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(300, 300)];
    _animation.values = @[value1, value2];
}

#pragma mark - 抛物线
- (void)creatQuadCurveBezierPath {
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    bezierPath.lineWidth = 2.f;
    [bezierPath moveToPoint:CGPointMake(10, 20)];
    [bezierPath addQuadCurveToPoint:CGPointMake(300, 20) controlPoint:CGPointMake(200, 400)];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = bezierPath.CGPath;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.strokeColor = [UIColor yellowColor].CGColor;
    [self.layer addSublayer:layer];
    
    _animation = [CAKeyframeAnimation animation];
    _animation.keyPath = @"position";
    _animation.duration = 2;
    _animation.delegate = self;
    _animation.path = bezierPath.CGPath;
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(10, 20)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(300, 20)];
    _animation.values = @[value1, value2];
}

#pragma mark - 圆
- (void)creatArcBezierPath {
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    bezierPath.lineWidth = 2.f;
    [bezierPath addArcWithCenter:self.center radius:150 startAngle:0 endAngle:2*M_PI clockwise:YES];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = bezierPath.CGPath;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.strokeColor = [UIColor yellowColor].CGColor;
    [self.layer addSublayer:layer];
    
    _animation = [CAKeyframeAnimation animation];
    _animation.keyPath = @"position";
    _animation.duration = 2;
    _animation.delegate = self;
    _animation.path = bezierPath.CGPath;
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(10, 20)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(300, 20)];
    _animation.values = @[value1, value2];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    [_animationView removeFromSuperview];
    [_animationView.layer removeFromSuperlayer];
}

#pragma mark - 开始动画
- (void)beginBezierAnimation {
    _animationView = [UIView new];
    _animationView.backgroundColor = [UIColor redColor];
    _animationView.center = CGPointMake(10, 20);
    _animationView.bounds = CGRectMake(0, 0, 10, 10);
    _animationView.layer.cornerRadius = 5.f;
    _animationView.clipsToBounds = YES;
    [self.layer addSublayer:_animationView.layer];
    [self addSubview:_animationView];
    [_animationView.layer addAnimation:_animation forKey:@""];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
