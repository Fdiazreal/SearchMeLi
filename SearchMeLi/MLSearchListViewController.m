//
//  ViewController.m
//  SearchMeLi
//
//  Created by Federico Diaz Real on 10/3/16.
//  Copyright © 2016 Federico Diaz Real. All rights reserved.
//

#import "MLSearchListViewController.h"

static NSString* const MLSearchViewControllerTableIdentifier = @"ATableIdentifier"; // MLSearchListViewControllerTableIdentifier

@interface MLSearchListViewController ()

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation MLSearchListViewController
{
    NSArray *tableData;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //[self.tableView registerNib:<#(nullable UINib *)#> forCellReuseIdentifier:<#(nonnull NSString *)#>
    // Test
    
    tableData = [NSArray arrayWithObjects:@"Row 1", @"Row 2", @"Row 3", @"Row 4", @"Row 5", @"Row 6", @"Row 7", @"Row 8", @"Row 9", @"Row 10", @"Row 11", @"Row 12", @"Row 13", @"Row 14", @"Row 15", @"Row 16", @"Row 17", @"Row 18", @"Row 19", @"Row 20", @"Row 21", @"Row 22", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDatasource protocol

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Try to reuse a cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MLSearchViewControllerTableIdentifier];
    
    // If the cell is nil, then we have to create one
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier: MLSearchViewControllerTableIdentifier];
    }
    
    // Modify the cell
    cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = @"Holi esto es un detail text label";
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
