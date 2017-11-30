//
//  RequestResponse.m
//  WiproAssignment
//
//  Created by anand madhav on 29/11/17.
//  Copyright © 2017 anand madhav. All rights reserved.
//

#import "RequestHandler.h"

@implementation RequestHandler  

+(NSMutableURLRequest*)createGetRequest:(NSString *)urlString {
    NSMutableURLRequest * theRequest = [[NSMutableURLRequest alloc] init];
    [theRequest setURL:[NSURL URLWithString:urlString]];
    [theRequest setHTTPMethod:REQUEST_TYPE_GET];
    return theRequest;
}
@end
