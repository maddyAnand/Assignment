//
//  UIView+UiviewConstraints.m
//  WiproAssignment
//
//  Created by anand madhav on 30/11/17.
//  Copyright © 2017 anand madhav. All rights reserved.
//

#import "UIView+UiviewConstraints.h"

@implementation UIView (UiviewConstraints)

#pragma mark - Leading Trailing Top Bottom

-(void) addLeadingConstraintToView: (UIView *) view relation: (NSLayoutRelation )relation constant: (CGFloat) constant priority: (UILayoutPriority) priority{
    
    NSLayoutConstraint * constraint = [self createConstraintattribute: NSLayoutAttributeLeading toView:view attribute2: NSLayoutAttributeLeading relation: relation constant:constant];
    constraint.priority = priority;
    
    [view addConstraint:constraint];
    
}

-(void) addTrailingConstraintToView: (UIView *) view relation: (NSLayoutRelation )relation constant: (CGFloat) constant priority: (UILayoutPriority) priority{
    
    NSLayoutConstraint * constraint = [self createConstraintattribute: NSLayoutAttributeTrailing toView:view attribute2: NSLayoutAttributeTrailing relation: relation constant:constant];
    constraint.priority = priority;
    
    [view addConstraint:constraint];
    
}

-(void) addTopConstraintToView: (UIView *) view relation: (NSLayoutRelation )relation constant: (CGFloat) constant priority: (UILayoutPriority) priority{
    
    NSLayoutConstraint * constraint = [self createConstraintattribute: NSLayoutAttributeTop toView:view attribute2: NSLayoutAttributeBottom relation: relation constant:constant];
    constraint.priority = priority;
    
    [view addConstraint:constraint];
    
}

-(void) addBottomConstraintToView: (UIView *) view relation: (NSLayoutRelation )relation constant: (CGFloat) constant priority: (UILayoutPriority) priority{
    
    NSLayoutConstraint * constraint = [self createConstraintattribute: NSLayoutAttributeBottom toView: view attribute2: NSLayoutAttributeTop relation: relation constant:constant];
    constraint.priority = priority;
    
    [view addConstraint:constraint];
    
}

#pragma mark- Height Width

- (void) addWidthConstraint: (NSLayoutRelation) relation constant: (CGFloat) constant priority: (UILayoutPriority) priority{
    NSLayoutConstraint *constraint = [self createConstraintattribute: NSLayoutAttributeWidth toView:nil attribute2:NSLayoutAttributeNotAnAttribute relation:relation constant:constant];
    constraint.priority = priority;
    
    [self addConstraint:constraint];
}

- (void) addHeightConstraint: (NSLayoutRelation) relation constant: (CGFloat) constant priority: (UILayoutPriority) priority{
    NSLayoutConstraint *constraint = [self createConstraintattribute: NSLayoutAttributeHeight toView:nil attribute2:NSLayoutAttributeNotAnAttribute relation:relation constant:constant];
    constraint.priority = priority;
    
    [self addConstraint:constraint];
}

#pragma mark- Center X

- (void) addCenterXConstraint: (UIView *) view relation: (NSLayoutRelation) relation constraint: (CGFloat) constant priority: (UILayoutPriority) priority{
    NSLayoutConstraint* constraint = [self createConstraintattribute:NSLayoutAttributeCenterX toView:view attribute2:NSLayoutAttributeCenterX relation:relation constant:constant];
    constraint.priority = priority;
    
    [view addConstraint:constraint];
}

- (void) addCenterYConstraint: (UIView *) view relation: (NSLayoutRelation) relation constraint: (CGFloat) constant priority: (UILayoutPriority) priority{
    NSLayoutConstraint* constraint = [self createConstraintattribute:NSLayoutAttributeCenterY toView:view attribute2:NSLayoutAttributeCenterY relation:relation constant:constant];
    constraint.priority = priority;
    
    [view addConstraint:constraint];
}

-(NSLayoutConstraint *) createConstraintattribute: (NSLayoutAttribute) attribute1 toView: (UIView *)view attribute2: (NSLayoutAttribute) attribute2 relation: (NSLayoutRelation )relation constant: (CGFloat) constant{
   
    self.translatesAutoresizingMaskIntoConstraints = false;
    
    NSLayoutConstraint* constraint = [NSLayoutConstraint constraintWithItem:self attribute: attribute1 relatedBy: relation toItem:view attribute: attribute2 multiplier:1.0 constant:constant];
    
    return constraint;
}

@end
