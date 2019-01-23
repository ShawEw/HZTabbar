//
//  HZTabView.m
//  TabView
//
//  Created by jiang junhui on 2019/1/21.
//  Copyright © 2019 hongzheng. All rights reserved.
//

#import "HZTabBarView.h"



@interface HZTabBarView()

@property (nonatomic,strong) NSMutableArray<UIButton *> *btnList;
@property (nonatomic,assign) NSInteger selectIndex;
@property (nonatomic,strong) UIButton *bigBtn;
@property (nonatomic,assign) CGRect origionFrame;
@property (nonatomic,assign) BOOL hasBigBtn;
@end

@implementation HZTabBarView

-(UIButton *)bigBtn{
    if (!_bigBtn) {
        _bigBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_bigBtn setImage:[UIImage imageNamed:_bigBtnImage] forState:UIControlStateNormal];
        _bigBtn.tag = 999;
        [_bigBtn sizeToFit];
        [_bigBtn addTarget:self action:@selector(clickBtnTabBar:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _bigBtn;
}

-(NSMutableArray *)btnList{
    if (!_btnList) {
        _btnList = [NSMutableArray new];
    }
    return _btnList;
}

-(instancetype)initFrame:(CGRect)frame tabList:(NSMutableArray<HZTabModel *> *)tabList{
    self = [super initWithFrame:frame];
    if (self) {
        _origionFrame = frame;
        _tabList = tabList;
        [self initUI];
    }
    return self;
}

- (void)initUI{
    for(UIView *subView in [self subviews])
    {
        if ([subView isKindOfClass:[UIButton class]]) {
            [subView removeFromSuperview];
        }
    }
    self.backgroundColor = [UIColor groupTableViewBackgroundColor];
    //循环生成tab 控制tab数量少于5个
    if (_tabList == nil) {
        _tabList = [NSMutableArray new];
    }
    NSInteger endCount = _tabList.count > 5 ? 5 : _tabList.count;
    for (NSInteger i = 0; i < endCount; i++) {
        //点击的按钮
        HZTabModel *model = _tabList[i];
        if (model.titleColor == nil) {
            model.titleColor = [UIColor blackColor];
        }
        if (model.titleSelectColor == nil) {
            model.titleSelectColor = [UIColor redColor];
        }
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake((self.frame.size.width/endCount)*i, 0, self.frame.size.width /endCount, self.frame.size.height);
        btn.adjustsImageWhenHighlighted = NO;
        [btn setImage:[UIImage imageNamed:model.normalImg] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:model.selectImg] forState:UIControlStateSelected];
        [btn setTitle:model.title forState:UIControlStateNormal];
        [btn setTitleColor:model.titleColor forState:UIControlStateNormal];
        [btn setTitleColor:model.titleSelectColor forState:UIControlStateSelected];
        btn.titleLabel.font = [UIFont systemFontOfSize: 14.0];
        btn.tag = 1000 + i;
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//使图片和文字水平居中显示
        [btn setTitleEdgeInsets:UIEdgeInsetsMake(btn.imageView.frame.size.height ,-btn.imageView.frame.size.width, HZ_TAB_IsiPhoneX ? 10 : 0.0,0.0)];//文字距离上边框的距离增加imageView的高度，距离左边框减少imageView的宽度，距离下边框和右边框距离不变
        [btn setImageEdgeInsets:UIEdgeInsetsMake(0.0, 0.0,btn.titleLabel.bounds.size.height + (HZ_TAB_IsiPhoneX ? 20 : 0.0), -btn.titleLabel.bounds.size.width)];
        if (i == 0) {
            _selectIndex = 0;
            [btn setSelected:YES];
        }
        [btn addTarget:self action:@selector(clickBtnTabBar:) forControlEvents:UIControlEventTouchUpInside];
        [self.btnList addObject:btn];
        [self addSubview:btn];
    }
    if (_hasBigBtn) {
        [self addSubview:self.bigBtn];
    }
}

-(void)layoutSubviews{
    [super layoutSubviews];
    for (NSInteger i = 0; i < self.btnList.count; i++) {
        //点击的按钮
        UIButton *btn = self.btnList[i];
        btn.frame = CGRectMake((self.frame.size.width/self.btnList.count)*i, 0, self.frame.size.width /self.btnList.count, self.frame.size.height);
    }
    [self.bigBtn sizeToFit];
    CGFloat heightOffset = HZ_TAB_IsiPhoneX ? self.bigBtn.frame.size.height / 2 : 25;
    self.bigBtn.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2 - heightOffset);
}

-(void)clickBtnTabBar:(UIButton *)btn{
    NSInteger index = 0;
    if (btn.tag < 1000) {
        if ([_delegate respondsToSelector:@selector(tabview:bigSelect:)]) {
            [self.delegate tabview:self bigSelect:btn];
        }
    }else{
        index = btn.tag - 1000;
        if (index == _selectIndex) {
            return;
        }
        [self.btnList[_selectIndex] setSelected:NO];
        _selectIndex = index;
        [btn setSelected:YES];
        if ([_delegate respondsToSelector:@selector(tabView:didSelect:)]) {
            [self.delegate tabView:self didSelect:index];
        }
    }
    [UIView animateWithDuration:0.2 animations:^{
        btn.transform = CGAffineTransformMakeScale(1.2, 1.2);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            //回复原始状态
            btn.transform = CGAffineTransformIdentity;
        }];
    }];
    
}

- (void)showView{
    CGRect frame = _origionFrame;
    [UIView animateWithDuration:0.3 animations:^{
        self.frame = frame;
    }];
}

- (void)hideView{
    CGRect frame = _origionFrame;
    [UIView animateWithDuration:0.3 animations:^{
        self.frame = CGRectMake(frame.origin.x, frame.origin.y + frame.size.height, frame.size.width, frame.size.height);
    }];
}

-(UIColor *)colorWithHexString:(NSString *)stringToConvert

{
    if ([stringToConvert hasPrefix:@"#"])
    {
        stringToConvert = [stringToConvert substringFromIndex:1];
    }
    NSScanner *scanner = [NSScanner scannerWithString:stringToConvert];
    unsigned hexNum;
    if (![scanner scanHexInt:&hexNum])
    {
        return nil;
    }
    return [self colorWithRGBHex:hexNum];
}

-(UIColor *)colorWithRGBHex:(UInt32)hex

{
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    return [UIColor colorWithRed:r / 255.0f
                           green:g / 255.0f
                            blue:b / 255.0f
                           alpha:1.0f];
    
}

@end
