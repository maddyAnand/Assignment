//
//  ViewController.h
//  WiproAssignment
//
//  Created by anand madhav on 29/11/17.
//  Copyright © 2017 anand madhav. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
-(void) fetchServerData;
-(void)maintask;
@property(nonatomic , strong) NSString *titleString;
@end

