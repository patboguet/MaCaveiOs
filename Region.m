//
//  Region.m
//  MaCaveiOs
//
//  Created by Patrick Boguet on 19/09/2015.
//  Copyright (c) 2015 Patrick Boguet. All rights reserved.
//

#import "Region.h"
#import "ListeVinsViewController.h"

@implementation Region

@synthesize idRegion,nom;

- (NSString*) getNomRegion:(NSInteger)idR
{
    ListeVinsViewController *LVVC = [[ListeVinsViewController alloc]init];
    
    NSMutableArray *regArr = [[NSMutableArray alloc] initWithArray:LVVC.regions];
    Region *reg = [[Region alloc] init];
    reg = [regArr objectAtIndex:idR-1];
    NSString *region = reg.nom;
    
    return region;
}

@end
