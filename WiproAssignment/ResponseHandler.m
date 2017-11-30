//
//  ResponseHandler.m
//  WiproAssignment
//
//  Created by anand madhav on 29/11/17.
//  Copyright © 2017 anand madhav. All rights reserved.
//

#import "ResponseHandler.h"

@implementation ResponseHandler
+(void) processRequest:(NSMutableURLRequest *) theRequest WithCompletionHandler:(void(^)(id theJson , NSError * theError))reponseCompletion{
    [NSURLConnection sendAsynchronousRequest:theRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        
        if (connectionError) {
            reponseCompletion(nil, connectionError);
            return ;
        }
        
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
        if (httpResponse.statusCode != 200) {
            reponseCompletion(nil,[NSError errorWithDomain:@"custom domain" code:000 userInfo:@{NSLocalizedDescriptionKey:@"Request Error"}]);
            return;
        }
        
        if (data == nil) {
            reponseCompletion(nil,[NSError errorWithDomain:@"custom domain" code:000 userInfo:@{NSLocalizedDescriptionKey:@"Data Error"}]);
            return;
        }
        
        NSError * theJsonError = nil;
        
        NSString *iso = [[NSString alloc] initWithData:data encoding:NSISOLatin1StringEncoding];
        
        NSData *datautf8 = [iso dataUsingEncoding:NSUTF8StringEncoding];
        
        id theJson = [NSJSONSerialization JSONObjectWithData:datautf8 options:kNilOptions error:&theJsonError];
        
        reponseCompletion(theJson,nil);
        
    }];
    
}

@end
