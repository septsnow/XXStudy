//
//  FFTableViewCell.m
//  FFEventChain
//
//  Created by humour on 2021/3/18.
//

#import "FFTableViewCell.h"

@implementation FFTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"cell touch");
}

@end
