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
#import "MLSearchService.h"
#import "MLSearchItem.h"

static NSString* const kMLSearchViewControllerTableIdentifier = @"ATableIdentifier";

@interface MLSearchListViewController ()

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSIndexPath *selectedRow;
@property (nonatomic, strong) MLSearchResponse *searchResponse;
@property (nonatomic, strong) NSString *query;
@property (nonatomic, strong) NSString *siteId;

@end

@implementation MLSearchListViewController

- (id)initWithQuery:(NSString *)query andSite:(NSString *)siteId {
    self = [super init];
    
    if(self){
        self.query = query;
        self.title = query;
        self.siteId = siteId;
    }
    
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tableView deselectRowAtIndexPath: self.selectedRow animated: YES];
    
    MLSearchService *searchService = [[MLSearchService alloc] init];
    
    __weak typeof(self) weakSelf = self;
    
    if(!self.searchResponse){
        
        [searchService search:self.query onSite:self.siteId success:^(MLSearchResponse *searchResponse){
            weakSelf.searchResponse = searchResponse;
            [self.tableView reloadData];
            
        } fail:nil];
    }
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UINib *pMLSearchListCellNib = [UINib nibWithNibName:NSStringFromClass([MLSearchListCell class]) bundle:nil];
    [self.tableView registerNib: pMLSearchListCellNib forCellReuseIdentifier: kMLSearchViewControllerTableIdentifier];
}

#pragma mark - UITableViewDatasource protocol

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.searchResponse.results count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Try to reuse a cell
    MLSearchListCell *cell = [tableView dequeueReusableCellWithIdentifier: kMLSearchViewControllerTableIdentifier];
    
    // Modify the cell
    MLSearchItem *item = self.searchResponse.results[indexPath.row];
    
    cell.priceLabel.text = [NSString stringWithFormat:@"$ %@", item.itemPrice];
    cell.titleLabel.text = item.itemTitle;
    
    UIImageView *imageView = cell.cellImage;
    
    [imageView setImageWithURL: [NSURL URLWithString: item.itemThumbnail]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MLSearchListCell *cell = [tableView dequeueReusableCellWithIdentifier: kMLSearchViewControllerTableIdentifier];

    // TODO: should cache this, it is an expensive operation
    return [cell systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedRow = indexPath;
    
    MLSearchListCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    
    UIImage *image = selectedCell.cellImage.image;
    NSString *title = selectedCell.titleLabel.text;
    NSString *price = selectedCell.priceLabel.text;
    
    UIViewController *vipViewController = [[MLVipViewController alloc] initWithImage:image withTitle:title andWithPrice:price];
    
    [self.navigationController pushViewController:vipViewController  animated:YES];
}

@end
