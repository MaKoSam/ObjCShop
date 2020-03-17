//
//  TableViewController.m
//  class1
//
//  Created by Sam Mazniker on 17/03/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@property (nonatomic, strong) UITableView* tableView;

@end

@implementation TableViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
    
    //TableView Setup
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource = self;
//    _tableView.delegate = self;
    [_tableView registerClass: [ThemeTableCell self] forCellReuseIdentifier:@"ThemeCell"];
    [self.view addSubview:_tableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[ThemeManager Theme].themeDataBase count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ThemeTableCell* newCell = [_tableView dequeueReusableCellWithIdentifier:@"ThemeCell"];
    if(!newCell){
        newCell = [[ThemeTableCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"ThemeCell"];
        newCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    //NewCell setup according Theme
    Theme* display = [[ThemeManager Theme].themeDataBase objectAtIndex: indexPath.row];
    
    [newCell.themeName setTextColor: display.fontColor];
    [newCell.themeName setText: display.themeName];
    [newCell setBackgroundColor: display.mainColor];
    return newCell;
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
