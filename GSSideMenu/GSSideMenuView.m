//
//  GSSideMenuView.m
//  GSSideMenu
//
//  Created by Gowri Sammandhamoorthy on 14/09/15.
//  Copyright © 2015 Gowri Sammandhamoorthy. All rights reserved.
//

#import "GSSideMenuView.h"
#import "GSCustomTableViewCell.h"
#import "GSDetailViewController.h"
#import "GSNavigationCotroller.h"

@interface GSSideMenuView ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation GSSideMenuView{
    NSDictionary* dataDic;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tbVw.dataSource = self;
    _tbVw.delegate = self;
    
     [_tbVw registerNib:[UINib nibWithNibName:@"GSCustomTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"Cell"];
    
    dataDic = [NSDictionary new];
    dataDic = @{
                @"Title" : @[@"Verizon", @"AT&T", @"T-Mobile", @"Sprint"],
                @"SubTitle": @[@"Basking Ridge, NJ", @"Dallas, TX", @"Bellevue, WA", @"Overland Park, KS"],
                @"Logo" : @[@"verizon", @"at&t", @"tmobile", @"sprint"],
                @"Image": @[@"verizon_image.png",@"att_image.png",  @"tmobile_image.jpg", @"sprint_image.png"]
                };
}

#pragma mark - tableView delegate methods.

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [dataDic[@"Title"] count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GSCustomTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[GSCustomTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    cell.titlelabel.text = dataDic[@"Title"][indexPath.row ];
     cell.subTitleLabel.text = dataDic[@"SubTitle"][indexPath.row ];
    cell.imgVw.image = [UIImage imageNamed:dataDic[@"Logo"][indexPath.row]];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 66.0f;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIStoryboard* storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    GSNavigationCotroller* present = [storyBoard instantiateViewControllerWithIdentifier:@"ToNavigationView"];
    [[NSUserDefaults standardUserDefaults]setValue:dataDic[@"Title"][indexPath.row ] forKey:@"Title"];
    [[NSUserDefaults standardUserDefaults]setValue:dataDic[@"Image"][indexPath.row ] forKey:@"Image"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    [self presentViewController:present animated:NO completion:nil];

}
@end
