//
//  MVCMutationTableViewCell.m
//  XXMVCTest
//
//  Created by 陈晨 on 2021/7/29.
//

#import "MVCMutationTableViewCell.h"
#import "MVCMutationModel.h"

@interface MVCMutationTableViewCell ()

@property (strong, nonatomic) UILabel* label;

@end

@implementation MVCMutationTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupViews];
    }
    return self;
}

#pragma mark - setups
- (void)setupViews {
    [self.contentView addSubview:self.label];
}

- (void)setupDatas {
    
}



- (void)setModel:(MVCMutationModel *)model {
    _model = model;
    _label.text = model.name;
}


- (UILabel *)label {
    if (!_label) {
        self.label = [[UILabel alloc] init];
        _label.textColor = [UIColor orangeColor];
        _label.font = [UIFont systemFontOfSize:15];
        _label.frame = CGRectMake(12, 7, 150, 30);
    }
    return _label;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if ([_delegate respondsToSelector:@selector(didClick)]) {
        [_delegate didClick];
    }
}


@end
