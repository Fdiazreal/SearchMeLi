//
//  MLSearchItem.m
//  SearchMeLi
//
//  Created by Federico Diaz Real on 10/13/16.
//  Copyright © 2016 Federico Diaz Real. All rights reserved.
//

#import "MLSearchItem.h"

@implementation MLSearchItemModel

- (id) initWithDictionary:(NSDictionary*)searchItem {
    self = [super init];
    
    if(self) {
        self.itemTitle = searchItem[@"title"];
        self.itemPrice = searchItem[@"price"];
        self.itemThumbnail = searchItem[@"thumbnail"];
    }
    
    return self;
}

@end
