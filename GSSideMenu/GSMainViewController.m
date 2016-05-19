//
//  ViewController.m
//  GSSideMenu
//
//  Created by Gowri Sammandhamoorthy on 14/09/15.
//  Copyright © 2015 Gowri Sammandhamoorthy. All rights reserved.
//

#import "GSMainViewController.h"
#import "GSSideMenuView.h"

@interface GSMainViewController ()

@end

@implementation GSMainViewController{
    GSSideMenuView* sideMenuView;
    BOOL sideMenuPresssed;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;
    sideMenuView = [self sideMenuCreation:self.view];
    
    [[self createLeftSwipeGesture:self.view] addTarget:self action:@selector(swipeLeft:)];
    
}

#pragma mark - Action Bar Button.

- (IBAction)SideMenuButtonPressed:(id)sender {
    if (sideMenuPresssed == YES) {
        sideMenuPresssed = NO;
    }
    else{
        sideMenuPresssed = YES;
    }
    [self sideMenuToggleMethodWithOuterContainerAndToolBar:_outerContainer andSideMenuView:sideMenuView.view andWithView:self.view and:self.navigationController.navigationBar and:self.navigationController.toolbar ];
    
}

#pragma mark - reusable method for side menu creation.

-(GSSideMenuView*)sideMenuCreation:(UIView*)view{
  GSSideMenuView* sideMenu = [[GSSideMenuView alloc]init];
    sideMenu.tabBarController.tabBar.hidden = YES;
    sideMenu.navigationController.toolbar.hidden = YES;
    sideMenu.view.frame =CGRectMake(view.frame.origin.x+view.frame.size.width,20,view.frame.size.width, view.frame.size.height-20);
    [self.view addSubview:sideMenu.view];
    return sideMenu;
}

#pragma mark - Resuable method for side menu toggle.

-(void)sideMenuToggleMethodWithOuterContainerAndToolBar:(UIView*)outerContainer andSideMenuView:(UIView*)sideMenu andWithView:(UIView*)view and:(UINavigationBar*)navigationBar and:(UIToolbar*)toolBar{
    
    CGRect destinTool = CGRectMake(0, toolBar.frame.origin.y, toolBar.frame.size.width, toolBar.frame.size.height);
    CGRect destinNav = navigationBar.frame;
    CGRect destinationmain = outerContainer.frame;
    
    if (destinationmain.origin.x <0) {
        destinationmain.origin.x = 0;
        destinNav.origin.x = 0;
        destinTool.origin.x = 0;
    }
    else{
        destinationmain.origin.x = -(outerContainer.frame.size.width-70);
        destinNav.origin.x = -(navigationBar.frame.size.width-70);
        destinTool.origin.x = -(toolBar.frame.size.width-70);
    }
    [UIView animateWithDuration:0.25 animations:^{
        outerContainer.frame = destinationmain;
        navigationBar.frame = destinNav;
        toolBar.frame = destinTool;
        
    }];
    
    CGRect destination1 = sideMenu.frame;
    if (destination1.origin.x >= view.frame.size.width) {
        destination1.origin.x = 75;
    }
    else{
        destination1.origin.x = view.frame.size.width;
    }
    [UIView animateWithDuration:0.25 animations:^{
        sideMenu.frame =destination1;
        sideMenu.layer.shadowColor = [UIColor blackColor].CGColor;
        sideMenu.layer.shadowOpacity = 0.5f;
    }];
}




#pragma mark - Creating Left Swipe for side menu.

-(UISwipeGestureRecognizer*)createLeftSwipeGesture:(UIView*)view{
    UISwipeGestureRecognizer* swipeLeft=[[UISwipeGestureRecognizer alloc]init];
    swipeLeft.direction=UISwipeGestureRecognizerDirectionLeft;
    [view addGestureRecognizer:swipeLeft];
    return swipeLeft;
}

-(void)swipeLeft:(UISwipeGestureRecognizer *)gestureRecognizer{
    sideMenuPresssed = YES;
    [self sideMenuToggleMethodWithOuterContainerAndToolBar:_outerContainer andSideMenuView:sideMenuView.view andWithView:self.view and:self.navigationController.navigationBar and:self.navigationController.toolbar ];
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    if (sideMenuPresssed) {
        [self sideMenuToggleMethodWithOuterContainerAndToolBar:_outerContainer andSideMenuView:sideMenuView.view andWithView:self.view and:self.navigationController.navigationBar and:self.navigationController.toolbar ];
         sideMenuPresssed = NO;
    }
}

- (IBAction)exitBarButtonPressed:(id)sender {
    exit(0);
}

@end
