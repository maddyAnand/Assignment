//
//  City.h
//  WiproAssignment
//
//  Created by anand madhav on 02/12/17.
//  Copyright © 2017 anand madhav. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface City : NSObject
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *Description;
@property(nonatomic,strong)NSString *image;
@property(nonatomic,strong)NSString *city;
-(City*)initWithCityInfo :(NSDictionary*)info;
@end
