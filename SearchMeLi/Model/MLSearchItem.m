//
//  MLSearchItem.m
//  SearchMeLi
//
//  Created by Federico Diaz Real on 10/13/16.
//  Copyright © 2016 Federico Diaz Real. All rights reserved.
//

#import "MLSearchItem.h"

@implementation MLSearchItem

- (id) initWithDictionary:(NSDictionary*)searchItem {
    self = [super init];
    
    if(self) {
        self.itemTitle = searchItem[@"title"];
        self.itemPrice = searchItem[@"price"];
        
        NSString *secureThumbnailURL = [searchItem[@"thumbnail"] stringByReplacingOccurrencesOfString:@"http://" withString:@"https://"];
        // Use a bigger picture
        self.itemThumbnail = [secureThumbnailURL stringByReplacingOccurrencesOfString:@"-I.jpg" withString:@"-C.png"];
    }
    
    return self;
}

@end
