//
//  MLSearchListCell.h
//  SearchMeLi
//
//  Created by Federico Diaz Real on 10/7/16.
//  Copyright © 2016 Federico Diaz Real. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MLSearchListCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIImageView *cellImage;
@property (nonatomic, weak) IBOutlet UILabel *priceLabel;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;

@end
