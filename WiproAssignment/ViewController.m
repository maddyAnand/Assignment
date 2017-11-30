//
//  ViewController.m
//  WiproAssignment
//
//  Created by anand madhav on 29/11/17.
//  Copyright © 2017 anand madhav. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableViewCell.h"
#import "RequestHandler.h"
#import "ResponseHandler.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "UIView+UiviewConstraints.h"

@interface ViewController ()
{
    UITableView *tblView;
    NSArray *arrayDataOfCity;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    [self setLayOutConstraintsForView];
    [self fetchServerData];
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void) fetchServerData
{
    NSMutableURLRequest *request = [RequestHandler createGetRequest:[NSString stringWithFormat:@"%@%@",KBaseUrl,FACTS]];
    [ResponseHandler processRequest:request WithCompletionHandler:^(id theJson, NSError *theError) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (theJson) {
                arrayDataOfCity = [theJson objectForKey:@"rows"];
                self.title = [theJson objectForKey:@"title"];
                [tblView reloadData];
                [tblView.refreshControl endRefreshing];
            }
        });
    }];
    
}

-(void)setLayOutConstraintsForView{
    
    tblView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:tblView];
    
    tblView.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint * leadingConstraint = [NSLayoutConstraint constraintWithItem:tblView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
    [self.view addConstraint:leadingConstraint];
    
    NSLayoutConstraint * trailingConstraint = [NSLayoutConstraint constraintWithItem:tblView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
    [self.view addConstraint:trailingConstraint];
    
    NSLayoutConstraint * topConstraint = [NSLayoutConstraint constraintWithItem:tblView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    [self.view addConstraint:topConstraint];
    
    NSLayoutConstraint * bottomConstraint = [NSLayoutConstraint constraintWithItem:tblView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    [self.view addConstraint:bottomConstraint];
    
    
    tblView.rowHeight = UITableViewAutomaticDimension;
    tblView.estimatedRowHeight = 45;
    
    tblView.delegate = self;
    tblView.dataSource = self;
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"Pull to Refresh"];
    [refreshControl addTarget:self action:@selector(fetchServerData) forControlEvents:UIControlEventValueChanged];
    tblView.refreshControl = refreshControl;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[CustomTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    if ([[[arrayDataOfCity objectAtIndex:indexPath.row] valueForKey:@"title"] isKindOfClass:[NSString class]]) {
        cell.primaryLabel.text = [[arrayDataOfCity objectAtIndex:indexPath.row] valueForKey:@"title"];
    }
    if ([[[arrayDataOfCity objectAtIndex:indexPath.row] valueForKey:@"description"] isKindOfClass:[NSString class]]) {
        cell.secondaryLabel.text = [[arrayDataOfCity objectAtIndex:indexPath.row] valueForKey:@"description"];;
    }
    if ([[[arrayDataOfCity objectAtIndex:indexPath.row] valueForKey:@"imageHref"] isKindOfClass:[NSString class]]) {
        [cell.myImageView sd_setImageWithURL:[NSURL URLWithString:[[arrayDataOfCity objectAtIndex:indexPath.row] valueForKey:@"imageHref"]] placeholderImage:[UIImage imageNamed:@"placeHolder"]];
    }
    
    if (cell != nil){
    }

    return cell;
}

- (CGFloat)getLabelHeight:(NSString*)string
{
    CGFloat maxLabelWidth = self.view.bounds.size.width - 80;
    UILabel * label = [[UILabel alloc]init];
    label.font = [UIFont systemFontOfSize:14];
    label.numberOfLines = 0;
    label.text = [NSString stringWithFormat:@"%@",string];
    CGSize neededSize = [label sizeThatFits:CGSizeMake(maxLabelWidth, CGFLOAT_MAX)];
    return neededSize.height;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrayDataOfCity.count;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    //tblView.frame = self.view.bounds;
}

@end
