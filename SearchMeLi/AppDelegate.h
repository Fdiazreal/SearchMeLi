//
//  AppDelegate.h
//  SearchMeLi
//
//  Created by Federico Diaz Real on 10/3/16.
//  Copyright © 2016 Federico Diaz Real. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLSearchViewController.h"

@class MLSearchListViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MLSearchViewController *viewController;

@end

