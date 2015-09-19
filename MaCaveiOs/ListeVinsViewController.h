//
//  ListeVinsViewController.h
//  MaCaveiOs
//
//  Created by Patrick Boguet on 19/09/2015.
//  Copyright (c) 2015 Patrick Boguet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListeVinsViewController : UITableViewController

@property (nonatomic, retain) NSMutableArray *vins;
@property (nonatomic, retain) NSMutableArray *regions;
@property (nonatomic, retain) NSMutableArray *appellations;
@property (nonatomic, retain) NSMutableArray *types;
@property (nonatomic, retain) NSMutableArray *lieuxAchat;
@property (nonatomic, retain) NSMutableArray *lieuxStockage;

-(void) loadVins;
-(void) loadRegions;
-(void) loadAppellations;
-(void) loadLieuxAchat;
-(void) loadLieuxStockage;
-(NSString*) getNomRegion:(NSInteger)idR;

@end
