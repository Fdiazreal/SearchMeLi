//
//  MLVipViewController.m
//  SearchMeLi
//
//  Created by Federico Diaz Real on 10/7/16.
//  Copyright © 2016 Federico Diaz Real. All rights reserved.
//

#import "MLVipViewController.h"

@interface MLVipViewController ()

@property (nonatomic, weak) IBOutlet UIImageView *mainImageView;
@property (nonatomic, weak) IBOutlet UILabel *priceUILabel;
@property (nonatomic, weak) IBOutlet UILabel *titleUILabel;

@property (nonatomic, weak) IBOutlet UIImage *mainImage;
@property (nonatomic, weak) IBOutlet NSString *itemPrice;
@property (nonatomic, weak) IBOutlet NSString *itemtTitle;

@end

@implementation MLVipViewController

- (id)initWithImage:(UIImage *)mainImage withTitle:(NSString *)itemTitle andWithPrice:(NSString *)itemPrice {
    
    self = [super init];
    
    if(self){
        self.mainImage = mainImage;
        self.itemPrice = itemPrice;
        self.itemtTitle = itemTitle;
        self.title = @"Item";
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mainImageView.image = self.mainImage;
    self.priceUILabel.text = self.itemPrice;
    self.titleUILabel.text = self.itemtTitle;
    
    // One of these lines should fix the problem with the image staying under the navbar
    //self.navigationController.navigationBar.translucent = NO;
    //self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
