//
//  MLSearchService.m
//  SearchMeLi
//
//  Created by Federico Diaz Real on 10/12/16.
//  Copyright © 2016 Federico Diaz Real. All rights reserved.
//

#import "MLSearchService.h"
#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

static NSString* const kMLSearchBaseUrl = @"https://api.mercadolibre.com/sites/%@/search";

@interface MLSearchService()

@end

@implementation MLSearchService

- (void)search:(NSString *)query
            onSite:(NSString *)siteId
            success:(void (^)(MLSearchResponse *search))successBlock
            fail:(void (^)())fail {
    
    NSString *url = [NSString stringWithFormat:kMLSearchBaseUrl, siteId];

    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    [sessionManager GET:url
             parameters:@{@"q": query, @"limit": @10}
               progress:nil
                success:^(NSURLSessionTask *task, id responseObject){
                    
                    MLSearchResponse *searchResults = [[MLSearchResponse alloc] initWithDictionary:responseObject];
                    NSLog(@"Items: %@", searchResults.results);
                    
                    successBlock(searchResults);
                } failure:^(NSURLSessionTask *task, NSError *error){
                    NSLog(error);
                } ];
}

@end
