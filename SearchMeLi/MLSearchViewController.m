//
//  MLSearchViewController.m
//  SearchMeLi
//
//  Created by Federico Diaz Real on 10/17/16.
//  Copyright © 2016 Federico Diaz Real. All rights reserved.
//

#import "MLSearchViewController.h"
#import "MLSearchListViewController.h"

static NSArray* kSites;

@interface MLSearchViewController ()

@property (nonatomic, strong) NSArray *siteIds;
@property (nonatomic, strong) NSString *selectedSiteId;

@property (nonatomic, weak) IBOutlet UITextField *queryField;
@property (nonatomic, weak) IBOutlet UITextField *siteInput;

@end

@implementation MLSearchViewController

-(instancetype)init{
    self = [super init];
    
    if(self){
        self.title = @"Search";
    }
    
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    
    self.siteIds = @[@"MLA", @"MLB", @"MLM", @"MLC", @"MLV", @"MCO", @"MPE"];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIPickerView *sitePicker = [[UIPickerView alloc] init];
    
    [sitePicker setDelegate:self];
    [sitePicker setDataSource:self];
    
    self.siteInput.inputView = sitePicker;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Picker Delegate & Datasource
- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.siteIds count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [self.siteIds objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSString *siteId = [self.siteIds objectAtIndex:row];
    
    self.selectedSiteId = siteId;
    self.siteInput.text = siteId;
    
    [self.siteInput endEditing:YES];
}

#pragma mark - IBActions
- (IBAction)search:(UIButton *)sender {
    MLSearchListViewController *searchListViewController = [[MLSearchListViewController alloc] initWithQuery:self.queryField.text andSite:self.selectedSiteId];
    
    [self.navigationController pushViewController:searchListViewController animated:YES];
}

@end
