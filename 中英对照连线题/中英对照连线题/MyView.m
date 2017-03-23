//
//  MyView.m
//  中英对照连线题
//
//  Created by 唐天成 on 2016/11/20.
//  Copyright © 2016年 唐天成. All rights reserved.
//

#import "MyView.h"
#import "Masonry.h"
#import "UIView+FrameExpand.h"

@interface MyView()
@property (nonatomic, strong) NSArray *leftButtonArray;
@property (nonatomic, strong) NSArray *rightButtonArray;

//(其实写一个数组就可以了,写两个是为了更加直观)
//连线关系数组左端
@property (nonatomic, strong) NSMutableArray *leftlineRelationArray;
//连线关系数组右端
@property (nonatomic, strong) NSMutableArray *rightlineRelationArray;

//当前待匹配的左端按钮
@property (nonatomic, strong) UIButton *currentLeftSelectedBtn;
//当前待匹配的右端按钮
@property (nonatomic, strong) UIButton *currentRightSelectedBtn;



@end

@implementation MyView
- (NSArray *)leftButtonArray
{
    if (!_leftButtonArray) {
        NSMutableArray *arrarM = [NSMutableArray array];
        
        // 仅初始化控件，设置数组内容
        for (int i = 0; i < self.count; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            
            // 禁止按钮的用户交互
//            btn.userInteractionEnabled = NO;
            
            // 设置按钮的tag
            btn.tag = i;
            [btn addTarget:self action:@selector(leftBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [btn setBackgroundColor:[UIColor redColor]];
            
            // 设置背景图片
            [btn setBackgroundImage:[UIImage imageNamed:@"gesture_node_normal"] forState:UIControlStateNormal];
            [btn setTitle:[NSString stringWithFormat:@"LBtn%d",i] forState:UIControlStateNormal];
            [btn setBackgroundImage:[UIImage imageNamed:@"gesture_node_highlighted"] forState:UIControlStateSelected];
            [btn setTitle:[NSString stringWithFormat:@"LBtnSelected%d",i] forState:UIControlStateSelected];
            
            [self addSubview:btn];
            [arrarM addObject:btn];
        }
        
        // 返回数组
        _leftButtonArray = [arrarM copy];
    }
    return _leftButtonArray;
}
- (NSArray *)rightButtonArray
{
    if (!_rightButtonArray) {
        NSMutableArray *arrarM = [NSMutableArray array];
        
        // 仅初始化控件，设置数组内容
        for (int i = 0; i < self.count; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            
            // 禁止按钮的用户交互
//            btn.userInteractionEnabled = NO;
            
            // 设置按钮的tag
            btn.tag = i;
            [btn addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            // 设置背景图片
            [btn setBackgroundImage:[UIImage imageNamed:@"gesture_node_normal"] forState:UIControlStateNormal];
            [btn setTitle:[NSString stringWithFormat:@"RBtn%d",i] forState:UIControlStateNormal];
            [btn setBackgroundColor:[UIColor redColor]];
            [btn setBackgroundImage:[UIImage imageNamed:@"gesture_node_highlighted"] forState:UIControlStateSelected];
            [btn setTitle:[NSString stringWithFormat:@"RSele%d",i] forState:UIControlStateSelected];
            
            [self addSubview:btn];
            [arrarM addObject:btn];
        }
        
        // 返回数组
        _rightButtonArray = [arrarM copy];
    }
    return _rightButtonArray;
}


- (void)leftBtnClick:(UIButton *)btn {
    if(btn.selected == YES) {
        //按钮是选中时
        if([self.leftlineRelationArray[btn.tag] intValue]!= (-1)) {
            //如果是有连线
            btn.selected = NO;
            
            UIButton *rightBtn = self.rightButtonArray[[self.leftlineRelationArray[btn.tag] intValue]];
            rightBtn.selected = NO;
            self.rightlineRelationArray[[self.leftlineRelationArray[btn.tag] intValue]] = @(-1);
            self.leftlineRelationArray[btn.tag] = @(-1);
            
            
        } else {
            //如果是无连线的
            btn.selected = NO;
            self.currentLeftSelectedBtn = nil;
        }
    } else {
        //还没有选中
        btn.selected = YES;
        if(self.currentRightSelectedBtn != nil) {
            //如果点击后能与右边匹配
            self.leftlineRelationArray[btn.tag] = @(self.currentRightSelectedBtn.tag);
            self.rightlineRelationArray[self.currentRightSelectedBtn.tag] = @(btn.tag);
            self.currentRightSelectedBtn = nil;
            self.currentLeftSelectedBtn = nil;
            

        } else {
            //如果点击后不与右边匹配
            self.currentLeftSelectedBtn.selected = NO;
            self.currentLeftSelectedBtn = btn;
        }
      
    }
    
    [self setNeedsDisplay];

    
}
- (void)rightBtnClick:(UIButton *)btn {
    //按钮是选中时
    if(btn.selected == YES) {
        
        if([self.rightlineRelationArray[btn.tag] intValue]!= (-1)) {
            //如果是有连线
            btn.selected = NO;
            
            UIButton *leftBtn = self.leftButtonArray[[self.rightlineRelationArray[btn.tag] intValue]];
            leftBtn.selected = NO;
            self.leftlineRelationArray[[self.rightlineRelationArray[btn.tag] intValue]] = @(-1);
            self.rightlineRelationArray[btn.tag] = @(-1);
        } else {
            //如果是无连线的
            btn.selected = NO;
            self.currentRightSelectedBtn = nil;
        }
    } else {
        //还没有选中
        btn.selected = YES;
        if(self.currentLeftSelectedBtn != nil) {
            //如果点击后能与左边匹配
            self.rightlineRelationArray[btn.tag] = @(self.currentLeftSelectedBtn.tag);
            NSLog(@"%@",self.rightlineRelationArray);
            self.leftlineRelationArray[self.currentLeftSelectedBtn.tag] = @(btn.tag);
            NSLog(@"%@",self.leftlineRelationArray);
            self.currentRightSelectedBtn = nil;
            self.currentLeftSelectedBtn = nil;
            
            
        } else {
            //如果点击后不与左边匹配
            self.currentRightSelectedBtn.selected = NO;
            self.currentRightSelectedBtn = btn;
        }
    }
    [self setNeedsDisplay];
}

- (NSMutableArray *)leftlineRelationArray {
    if(!_leftlineRelationArray) {
        _leftlineRelationArray = [NSMutableArray array];
        for(int i = 0;i<self.count;i++) {
            [_leftlineRelationArray addObject:@(-1)];
        }
    }
    return _leftlineRelationArray;
}
- (NSMutableArray *)rightlineRelationArray {
    if(!_rightlineRelationArray) {
        _rightlineRelationArray = [NSMutableArray array];
        for(int i = 0;i<self.count;i++) {
            [_rightlineRelationArray addObject:@(-1)];
        }
    }
    return _rightlineRelationArray;
}


// 重新调整界面布局
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    for(int i =0;i<self.count;i++) {
        UIButton *lBtn = self.leftButtonArray[i];
        [lBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(87);
            make.height.mas_equalTo(87);
            make.left.with.offset(10);
            make.top.with.offset(i * 108);
        }];
        
        UIButton *rBtn = self.rightButtonArray[i];
        [rBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(87);
            make.height.mas_equalTo(87);
            make.right.with.offset(-10);
            make.top.with.offset(i * 108);
        }];
    }
}

- (void)drawRect:(CGRect)rect {
    
    for(int i = 0;i<self.leftlineRelationArray.count;i++) {
        NSNumber *number = self.leftlineRelationArray[i];
        if(number.intValue != (-1)) {
            UIButton *startPointButton = self.leftButtonArray[i];
            CGPoint startPoint = startPointButton.center;
            
            UIButton *destinationBtn = self.rightButtonArray[[self.leftlineRelationArray[i] intValue]];
            CGPoint destinationPoint = destinationBtn.center;
            UIBezierPath *bezierPath = [UIBezierPath bezierPath];
            [bezierPath moveToPoint:startPoint];
            [bezierPath addLineToPoint:destinationPoint];
            [[UIColor yellowColor]set];
            [bezierPath setLineWidth:10.0];
            [bezierPath setLineJoinStyle:kCGLineJoinRound];
            [bezierPath stroke];
        }
    }
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

        NSLog(@"leftlineRelationArray:%@\n    rightlineRelationArray:%@\n    currentBtn:%@Tag:%d\n   currentRightBtn%@Tage%d\n",self.leftlineRelationArray,self.rightlineRelationArray,self.currentLeftSelectedBtn,self.currentLeftSelectedBtn.tag,self.currentRightSelectedBtn,self.currentRightSelectedBtn.tag);
    
}
@end
