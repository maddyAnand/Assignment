//
//  CustomTableViewCell.m
//  WiproAssignment
//
//  Created by anand madhav on 29/11/17.
//  Copyright © 2017 anand madhav. All rights reserved.
//

#import "CustomTableViewCell.h"
#import "UIView+UiviewConstraints.h"

@implementation CustomTableViewCell
@synthesize primaryLabel,secondaryLabel,myImageView;
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)customizedUI {
    
    self.primaryLabel = [[UILabel alloc]init];
    self.primaryLabel.textColor = [UIColor blackColor];
    self.primaryLabel.textAlignment = NSTextAlignmentLeft;
    self.primaryLabel.font = [UIFont systemFontOfSize:16];
    
    self.secondaryLabel = [[UILabel alloc]init];
    self.secondaryLabel.textAlignment = NSTextAlignmentLeft;
    self.secondaryLabel.textColor = [UIColor blackColor];
    self.secondaryLabel.font = [UIFont systemFontOfSize:12];
    self.secondaryLabel.numberOfLines = 0;
    self.secondaryLabel.backgroundColor = [UIColor clearColor];

    self.myImageView = [[UIImageView alloc]init];
    
    [self.contentView addSubview:self.primaryLabel];
    [self.contentView addSubview:self.secondaryLabel];
    [self.contentView addSubview:self.myImageView];
    
    [primaryLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [secondaryLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [myImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    
#pragma mark- ImageView
    NSLayoutConstraint * widthImageViewConstraint = [NSLayoutConstraint constraintWithItem:myImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50];
    [myImageView addConstraint:widthImageViewConstraint];
    
    NSLayoutConstraint * heightImageViewConstraint = [NSLayoutConstraint constraintWithItem:myImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50];
    [myImageView addConstraint:heightImageViewConstraint];
    
    NSLayoutConstraint * leadingImageViewConstraint = [NSLayoutConstraint constraintWithItem:myImageView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:20];
    [self.contentView addConstraint:leadingImageViewConstraint];
    
    
    NSLayoutConstraint * centerYImageViewConstraint = [NSLayoutConstraint constraintWithItem:myImageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    [self.contentView addConstraint:centerYImageViewConstraint];
    
#pragma mark- Header
    NSLayoutConstraint * leadingHeaderConstraint = [NSLayoutConstraint constraintWithItem:primaryLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.myImageView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:20];
     [self.contentView addConstraint:leadingHeaderConstraint];
    
    NSLayoutConstraint * trailingHeaderConstraint = [NSLayoutConstraint constraintWithItem:primaryLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:20];
    [self.contentView addConstraint:trailingHeaderConstraint];

     
     NSLayoutConstraint * topHeaderConstraint = [NSLayoutConstraint constraintWithItem:primaryLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:20];
     [self.contentView addConstraint:topHeaderConstraint];
     
     NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:primaryLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant: 30];
     [primaryLabel addConstraint:heightConstraint];
     
     #pragma mark- SUbtitle
     NSLayoutConstraint * leadingConstraint = [NSLayoutConstraint constraintWithItem:secondaryLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:myImageView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:20];
     [self.contentView addConstraint:leadingConstraint];
     
     NSLayoutConstraint * trailingConstraint = [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:secondaryLabel attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:20];
     [self.contentView addConstraint:trailingConstraint];
     
     NSLayoutConstraint * topConstraint = [NSLayoutConstraint constraintWithItem:secondaryLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:primaryLabel attribute:NSLayoutAttributeBottom multiplier:1.0 constant:10];
     [self.contentView addConstraint:topConstraint];
     
     NSLayoutConstraint * bottomConstraint = [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:secondaryLabel attribute:NSLayoutAttributeBottom multiplier:1.0 constant:15];
     [self.contentView addConstraint:bottomConstraint];
    
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier{
     self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    [self customizedUI];
    
    return self;
}

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) {
        // Initialization code
    }
    return self;
}

- (void)layoutSubviews {

    [super layoutSubviews];
    

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
