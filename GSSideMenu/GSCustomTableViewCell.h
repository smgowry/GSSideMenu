//
//  GSCustomTableViewCell.h
//  GSSideMenu
//
//  Created by Gowri Sammandhamoorthy on 14/09/15.
//  Copyright © 2015 Gowri Sammandhamoorthy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GSCustomTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titlelabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imgVw;

@end
