//
//  PlaceViewController.h
//  TripPlaner
//
//  Created by Sam Mazniker on 09/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchEngine.h"
#import "PlaceTableCell.h"
#import "SearchViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface PlaceViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating>

@property (nonatomic, strong) UITableView* PlaceTable;
@property (nonatomic, strong) UISearchController* searchController;
@property (nonatomic, strong) NSArray* Places;
@property (nonatomic, strong) NSArray* SortedPlaces;

@property (nonatomic, strong, nonnull) NSString* searchType;

-(instancetype) initSearchOfType:(NSString*)type;



@end

NS_ASSUME_NONNULL_END
