//
//  MLSearchService.h
//  SearchMeLi
//
//  Created by Federico Diaz Real on 10/12/16.
//  Copyright © 2016 Federico Diaz Real. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "MLSearchResponse.h"

@interface MLSearchService : NSObject 

- (void)search:(NSString *)query onSite:(NSString *)siteId success:(void (^)(MLSearchResponse *searcb))successBlock fail:(void (^)())fail ;

@end