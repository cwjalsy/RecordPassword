//
//  QSImgTitleButton.m
//  MyCommunity
//
//  Created by JosQiao on 2016/12/23.
//  Copyright © 2016年 WenJim. All rights reserved.
//

#import "QSImgTitleButton.h"

@interface QSImgTitleButton ()

/** 图标 */
@property(nonatomic,strong)UIImageView *imgIcon;

/** 标题 */
@property(nonatomic,strong)UILabel *lblTitle;

/** 常态下的图标 */
@property (nonatomic ,copy)NSString *normalImg;

/** 选择状态下的图标 */
@property (nonatomic ,copy)NSString *selectedImg;


/** 选中标题 */
@property (nonatomic ,copy) NSString *qsSelectedTitle;

@end

@implementation QSImgTitleButton

static const CGFloat kTitleLableFontSize = 12.0f;

+ (instancetype)qsImgTitleButtionWithTitle:(NSString *)title selectedTitle:(NSString *)selectedTitle normalImg:(NSString *)img selectedImg:(NSString *)selectedImg
{
    QSImgTitleButton *btn = [QSImgTitleButton buttonWithType:UIButtonTypeCustom];
    
    if (btn) {
        btn.qsTitle = title;
        btn.qsSelectedTitle = selectedTitle;
        btn.normalImg = img;
        btn.selectedImg = selectedImg;
        btn.lblTitle.text = [NSString stringWithFormat:@"%@",title];
        btn.imgIcon.image = [UIImage imageNamed:img];
    }
    
    
    return btn;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUp];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self setUp];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGSize imgSize = self.imgIcon.image.size;
    CGFloat titleHeight = kTitleLableFontSize;
    
    CGFloat distan = (CGRectGetHeight(self.bounds) - imgSize.height - titleHeight) / 3.0f;
    
    self.imgIcon.frame = CGRectMake((CGRectGetWidth(self.bounds) - imgSize.width) / 2.0, distan, imgSize.width, imgSize.height);
    
    self.lblTitle.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), titleHeight);
    self.lblTitle.center = CGPointMake(CGRectGetWidth(self.bounds) / 2.0f, (distan * 2) + imgSize.height + (titleHeight / 2.0));
    
    
}


- (void)setUp
{
    _imgIcon = [[UIImageView alloc] init];

    _lblTitle = [[UILabel alloc] init];
    _lblTitle.font = [UIFont systemFontOfSize:kTitleLableFontSize];
    _lblTitle.textAlignment = NSTextAlignmentCenter;
    _lblTitle.textColor = WJColor(150, 150, 150, 1.0);
    
    [self addSubview:_imgIcon];
    [self addSubview:_lblTitle];
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:self];
    
    if (selected) {
        self.imgIcon.image = [UIImage imageNamed:self.selectedImg];
        //self.lblTitle.text = self.qsSelectedTitle;
    }else {
        self.imgIcon.image = [UIImage imageNamed:self.normalImg];
        //self.lblTitle.text = self.qsTitle;
    }
}

- (void)setQsTitle:(NSString *)qsTitle
{
    _qsTitle = [qsTitle copy];
    
    if (_qsTitle) {
        self.lblTitle.text = _qsTitle;
    }
}

@end
