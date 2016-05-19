//
//  GSDetailViewController.h
//  GSSideMenu
//
//  Created by Gowri Sammandhamoorthy on 14/09/15.
//  Copyright © 2015 Gowri Sammandhamoorthy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GSDetailViewController : UIViewController

//Properties
@property (weak, nonatomic) IBOutlet UIImageView *imageVw;


//Actions.
- (IBAction)homeButtonPressed:(id)sender;
- (IBAction)exitButtonPressed:(id)sender;

@end
