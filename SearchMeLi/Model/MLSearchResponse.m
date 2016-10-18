//
//  MLSearchModel.m
//  SearchMeLi
//
//  Created by Federico Diaz Real on 10/13/16.
//  Copyright © 2016 Federico Diaz Real. All rights reserved.
//

#import "MLSearchResponse.h"
#import "MLSearchItem.h"

@implementation MLSearchResponse

- (id) initWithDictionary:(NSDictionary*)search {
    self = [super init];
    
    if(self) {
        NSMutableArray* itemsList = [[NSMutableArray alloc] init];
        
        for (NSDictionary* searchItem in search[@"results"]) {
            
            MLSearchItem* item = [[MLSearchItem alloc] initWithDictionary:searchItem];
            [itemsList addObject: item];
        };
        
        self.results = [NSArray arrayWithArray:itemsList];
    }
    
    return self;
}


@end
