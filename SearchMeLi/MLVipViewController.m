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
@property (nonatomic, weak) IBOutlet NSString *priceString;
@property (nonatomic, weak) IBOutlet NSString *titleString;

@end

@implementation MLVipViewController

- (id)initWithImage:(UIImage *)mainImage withTitle:(NSString *)title andWithPrice:(NSString *)price {
    
    self = [super init];
    
    if(self){
        self.mainImage = mainImage;
        self.priceString = price;
        self.titleString = title;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Loaded VIP");
    self.mainImageView.image = self.mainImage;
    self.priceUILabel.text = [NSString stringWithFormat:@"$ %@", self.priceString ];
    self.titleUILabel.text = self.titleString;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
