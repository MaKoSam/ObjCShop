//
//  PlaceViewController.m
//  TripPlaner
//
//  Created by Sam Mazniker on 09/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import "PlaceViewController.h"

@interface PlaceViewController ()

@end

@implementation PlaceViewController

- (instancetype) initSearchOfType:(NSString *)type{
    self = [super init];
    if(self){
        self.searchType = type;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if(!self.PlaceTable){
        _PlaceTable = [[UITableView alloc] initWithFrame:[self.view bounds] style: UITableViewStylePlain];
    }
    if(!self.searchController){
        _searchController = [[UISearchController alloc] initWithSearchResultsController: nil];
    }
    if([self.navigationController isNavigationBarHidden]){
        [self.navigationController setNavigationBarHidden: NO];
    }
    
    //Setup TableView
    _PlaceTable.dataSource = self;
    _PlaceTable.delegate = self;
    
    [_PlaceTable setRowHeight:60.0];
    [_PlaceTable registerClass:[PlaceTableCell self] forCellReuseIdentifier:@"PlaceCell"];
    
    //Setup TableView SearchController
    _searchController.searchResultsUpdater = self;
    _searchController.obscuresBackgroundDuringPresentation = false;
    _searchController.searchBar.placeholder = @"Поиск Аэропорта";
    self.navigationItem.searchController = _searchController;
    self.definesPresentationContext = YES;
    
    if(!self.Places) {
        _Places = [[NSArray alloc] initWithArray:[DestinationsManager sharedInstance].airports];
        _SortedPlaces = [[NSArray alloc] init];
    }
    
    [self.view addSubview:_PlaceTable];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Table View Extension

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if([self isFiltering]){
        return [_SortedPlaces count];
    } else {
        return [_Places count];
    }
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    PlaceTableCell* newCell = [_PlaceTable dequeueReusableCellWithIdentifier:@"PlaceCell"];
    if(!newCell){
        newCell = [[PlaceTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"place"];
//        newCell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    }
    if([self isFiltering]){
        [newCell setAirport:[_SortedPlaces objectAtIndex:[indexPath row]]];
    } else {
        [newCell setAirport:[_Places objectAtIndex:[indexPath row]]];
    }
    return newCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    Airport* selectedPlace = [[Airport alloc] init];
    if([self isFiltering]){
        selectedPlace = [_SortedPlaces objectAtIndex:[indexPath row]];
    } else {
        selectedPlace = [_Places objectAtIndex:[indexPath row]];
    }

    if([self.searchType isEqualToString:@"origin"]){
        [ActiveSession sharedInstance].search.origin = selectedPlace.code;
    } else if([self.searchType isEqualToString:@"dest"]){
        [ActiveSession sharedInstance].search.destination = selectedPlace.code;
    }

    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Search Controller Extension

- (void)updateSearchResultsForSearchController:(nonnull UISearchController *)searchController {
    NSString* searchBar = [[NSString alloc] initWithString: [_searchController searchBar].text];
    [self filterContentForSearchText:searchBar];
}

-(BOOL) isFiltering {
    return _searchController.isActive && ![self isSearchBarEmpty];
}

-(BOOL) isSearchBarEmpty {
    if([_searchController.searchBar.text isEqual:[NSNull null]]){
        return YES;
    } else {
        return NO;
    }
}

-(void) filterContentForSearchText:(NSString*)text{
    SearchEngine* searcher = [[SearchEngine alloc] init];
    _SortedPlaces = [searcher findPlaceByKey:text];
    [_PlaceTable reloadData];
}

@end
