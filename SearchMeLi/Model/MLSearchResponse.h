//
//  MLSearchModel.h
//  SearchMeLi
//
//  Created by Federico Diaz Real on 10/13/16.
//  Copyright © 2016 Federico Diaz Real. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MLSearchResponse : NSObject

@property (nonatomic, strong) NSArray* results;

- (id) initWithDictionary:(NSDictionary*)search;

@end
