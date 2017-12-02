//
//  City.m
//  WiproAssignment
//
//  Created by anand madhav on 02/12/17.
//  Copyright © 2017 anand madhav. All rights reserved.
//

#import "City.h"

@implementation City
-(instancetype)initWithCityInfo :(NSDictionary*)info{
    self = [super init];
    if (self) {
        self.title = [info objectForKey:@"title"] ? : @"";
        self.Description = [info objectForKey:@"description"] ? : @"";
        self.image = [info objectForKey:@"imageHref"]? : @"";
    }
    return self;
}
@end
