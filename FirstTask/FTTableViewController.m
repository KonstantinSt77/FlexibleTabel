//
//  FTTableViewController.m
//  FirstTask
//
//  Created by iuser on 22.02.16.
//  Copyright © 2016 iuser. All rights reserved.
//

#import "FTTableViewController.h"
#import "FTTableViewCell.h"

@interface FTTableViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (copy, nonatomic) NSArray *tableData2;
@property (copy, nonatomic) NSArray *tableData1;

@end
@implementation FTTableViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    //NSArray *tableData;
    self.tableData1 = [NSArray arrayWithObjects:@"The White Snake",@"The Boy Who Cried Wolf",@"Helen of Troy",nil];
    self.tableData2 = [NSArray arrayWithObjects:@"This little known, but charming story by the Brothers Grimm is about a servant who learns to understand the speech of animals. He travels the world and does favours to creatures along the way. Then, when he needs help to win the hand of a princess, they come to his aid. Proofread by Claire Deakin. Read by Natasha. Duration 14 Minutes. A long time ago there lived a king who was famed for his wisdom through all the land. Nothing was hidden from him, and it seemed as if news of the most secret things was brought to him through the air. But he had a strange custom; every day after dinner, when the table was cleared, and no one else was present, a trusty servant had to bring him one more dish. It was covered, however, and even the servant did not know what was in it, neither did anyone else know, for the king never took off the cover to eat of it until he was quite alone.",
                       @"When I was a lad, my father used to send me out to the fields each day to watch over his sheep. Hey now! There are worse jobs than sitting out in the fresh air all day, but it was boring work for a lad. I longed to be running around with my friends, playing ball, or making boyish mischief.",
                       @"The story of Eris, the Goddess of Strife, is known from the remaining 50 lines of the Kypria, a lost epic of Greek Literature.The Judgement of Paris was told by the Latin Poet Ovid in his Heroides XVI.", nil];
    self.tableView.allowsSelection = NO;
    [self.tableView registerNib:[UINib nibWithNibName:@"TableCell" bundle:nil] forCellReuseIdentifier:@"TableCell"];
//    self.tableView.estimatedRowHeight = 60;
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

#pragma mark - TableView Test


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.tableData1 count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *TableIdentifier = @"TableCell";
    
    FTTableViewCell *cell = (FTTableViewCell *)[tableView dequeueReusableCellWithIdentifier:TableIdentifier];
    cell.label.text = [self.tableData1 objectAtIndex:indexPath.row];
    cell.ImageView.image = [UIImage imageNamed:@"1.png"];
    cell.descr.text = [self.tableData2 objectAtIndex:indexPath.row];
    
    cell.ImageView.layer.cornerRadius = 20.0f;
    cell.ImageView.layer.borderColor = [UIColor redColor].CGColor;
    cell.ImageView.layer.borderWidth = 1.0f;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    static FTTableViewCell *sizingCell = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sizingCell = [[[UINib nibWithNibName:@"TableCell" bundle:nil] instantiateWithOwner:self options:nil] firstObject];
    });
    sizingCell.descr.text = [self.tableData2 objectAtIndex:indexPath.row];
    [sizingCell setNeedsLayout];
    [sizingCell layoutIfNeeded];
    CGFloat height = [sizingCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    return height;

}


@end