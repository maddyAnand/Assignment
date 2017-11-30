//
//  RequestResponse.h
//  WiproAssignment
//
//  Created by anand madhav on 29/11/17.
//  Copyright © 2017 anand madhav. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Wipro.pch"
@interface RequestHandler : NSObject
+(NSMutableURLRequest*) createGetRequest:(NSString*) urlString;
@end
