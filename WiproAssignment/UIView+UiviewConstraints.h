//
//  UIView+UiviewConstraints.h
//  WiproAssignment
//
//  Created by anand madhav on 30/11/17.
//  Copyright © 2017 anand madhav. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (UiviewConstraints)

-(void) addLeadingConstraintToView: (UIView *) view relation: (NSLayoutRelation )relation constant: (CGFloat) constant priority: (UILayoutPriority) priority;

-(void) addTrailingConstraintToView: (UIView *) view relation: (NSLayoutRelation )relation constant: (CGFloat) constant priority: (UILayoutPriority) priority;

-(void) addTopConstraintToView: (UIView *) view relation: (NSLayoutRelation )relation constant: (CGFloat) constant priority: (UILayoutPriority) priority;

-(void) addBottomConstraintToView: (UIView *) view relation: (NSLayoutRelation )relation constant: (CGFloat) constant priority: (UILayoutPriority) priority;

- (void) addWidthConstraint: (NSLayoutRelation) relation constant: (CGFloat) constant priority: (UILayoutPriority) priority;

- (void) addHeightConstraint: (NSLayoutRelation) relation constant: (CGFloat) constant priority: (UILayoutPriority) priority;

- (void) addCenterXConstraint: (UIView *) view relation: (NSLayoutRelation) relation constraint: (CGFloat) constant priority: (UILayoutPriority) priority;

- (void) addCenterYConstraint: (UIView *) view relation: (NSLayoutRelation) relation constraint: (CGFloat) constant priority: (UILayoutPriority) priority;


@end
