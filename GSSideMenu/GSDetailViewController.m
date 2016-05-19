//
//  GSDetailViewController.m
//  GSSideMenu
//
//  Created by Gowri Sammandhamoorthy on 14/09/15.
//  Copyright © 2015 Gowri Sammandhamoorthy. All rights reserved.
//

#import "GSDetailViewController.h"
#import "GSMainViewController.h"

@interface GSDetailViewController ()

@end

@implementation GSDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title =[[NSUserDefaults standardUserDefaults]valueForKey:@"Title"];
    _imageVw.image = [UIImage imageNamed:[[NSUserDefaults standardUserDefaults]valueForKey:@"Image"]];
}

#pragma mark  - BarButton Action.

- (IBAction)homeButtonPressed:(id)sender {
    GSMainViewController* presentController = [self.storyboard instantiateViewControllerWithIdentifier:@"ToMainView"];
    [self.navigationController pushViewController:presentController animated:NO];
}

- (IBAction)exitButtonPressed:(id)sender {
    exit(0);
}



@end
