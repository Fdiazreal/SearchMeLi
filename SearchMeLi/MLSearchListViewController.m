//
//  ViewController.m
//  SearchMeLi
//
//  Created by Federico Diaz Real on 10/3/16.
//  Copyright © 2016 Federico Diaz Real. All rights reserved.
//
#import "UIImageView+AFNetworking.h"
#import "MLSearchListViewController.h"
#import "MLSearchListCell.h"
#import "MLVipViewController.h"

static NSString* const MLSearchViewControllerTableIdentifier = @"ATableIdentifier";

@interface MLSearchListViewController ()

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *tableData;
@property (nonatomic, strong) NSArray *priceData;
@property (nonatomic, strong) NSIndexPath *selectedRow;

@end

@implementation MLSearchListViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tableView deselectRowAtIndexPath: self.selectedRow animated: YES];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UINib *pMLSearchListCellNib = [UINib nibWithNibName:NSStringFromClass([MLSearchListCell class]) bundle:nil];
    [self.tableView registerNib:pMLSearchListCellNib forCellReuseIdentifier:MLSearchViewControllerTableIdentifier];
    
    self.tableData = @[@"Row 1", @"Row 2", @"Row 3", @"Row 4", @"Row 5", @"Row 6", @"Row 7", @"Row 8", @"Row 9", @"Row 10", @"Row 11", @"Row 12", @"Row 13", @"Row 14", @"Row 15", @"Row 16", @"Row 17", @"Row 18", @"Row 19", @"Row 20", @"Row 21", @"Row 22"];
    
    self.priceData = @[@100, @200, @300, @400, @500, @600, @700, @800, @900, @1000, @1100, @1200, @1300, @1400, @1500, @1600, @1700, @1800, @1900, @2000, @2100, @2200];
}

#pragma mark - UITableViewDatasource protocol

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Try to reuse a cell
    MLSearchListCell *cell = [tableView dequeueReusableCellWithIdentifier:MLSearchViewControllerTableIdentifier];
    
    // Modify the cell
    cell.priceLabel.text = [[self.priceData objectAtIndex:indexPath.row] stringValue];
    cell.titleLabel.text = [self.tableData objectAtIndex:indexPath.row];
    
    UIImageView *imageView = cell.imageView;
    
    NSString *imageUrl = [NSString stringWithFormat: @"%@%d", @"https://dummyimage.com/200x200/eeeeee/ff0000.png&text=Image+", indexPath.row + 1];
    
    [imageView setImageWithURL: [NSURL URLWithString: imageUrl]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MLSearchListCell *cell = [tableView dequeueReusableCellWithIdentifier:MLSearchViewControllerTableIdentifier];

    // TODO: should cache this, it is an expensive operation
    return [cell systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedRow = indexPath;
    
    [self.navigationController pushViewController: [[MLVipViewController alloc] init] animated:YES];
}

@end
