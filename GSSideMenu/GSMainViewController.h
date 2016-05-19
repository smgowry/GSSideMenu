//
//  ViewController.h
//  GSSideMenu
//
//  Created by Gowri Sammandhamoorthy on 14/09/15..
//  Copyright © 2015 Gowri Sammandhamoorthy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GSMainViewController : UIViewController

//Actions.
- (IBAction)SideMenuButtonPressed:(id)sender;
- (IBAction)exitBarButtonPressed:(id)sender;

//Properties.
@property (weak, nonatomic) IBOutlet UIView *outerContainer;

@end

