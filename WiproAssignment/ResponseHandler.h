//
//  ResponseHandler.h
//  WiproAssignment
//
//  Created by anand madhav on 29/11/17.
//  Copyright © 2017 anand madhav. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResponseHandler : NSObject

//+(void) processRequest:(NSMutableURLRequest *) theRequest WithCompletionHandler:(void(^)(id theJson , NSError * theError))reponseCompletion;
+(void) processRequest:(NSMutableURLRequest *) theRequest WithCompletionHandler:(void(^)(NSArray* theJson ,NSString *title, NSError * theError))reponseCompletion;
@end
