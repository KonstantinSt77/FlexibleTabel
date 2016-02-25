//
//  FTTableViewCell.h
//  FirstTask
//
//  Created by iuser on 22.02.16.
//  Copyright © 2016 iuser. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FTTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *label;
@property (nonatomic, weak) IBOutlet UILabel *descr;
@property (nonatomic, weak) IBOutlet UIImageView *ImageView;

@end
