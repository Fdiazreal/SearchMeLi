//
//  MLSearchItem.h
//  SearchMeLi
//
//  Created by Federico Diaz Real on 10/13/16.
//  Copyright © 2016 Federico Diaz Real. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MLSearchItemModel : NSObject

@property (nonatomic, strong) NSString *itemTitle;
@property (nonatomic, strong) NSNumber *itemPrice;
@property (nonatomic, strong) NSString *itemThumbnail;

- (id) initWithDictionary:(NSDictionary*)searchItem;

@end
