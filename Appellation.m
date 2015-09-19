//
//  Appellation.m
//  MaCaveiOs
//
//  Created by Patrick Boguet on 19/09/2015.
//  Copyright (c) 2015 Patrick Boguet. All rights reserved.
//

#import "Appellation.h"
#import "ListeVinsViewController.h"

@implementation Appellation

@synthesize idAppellation,nom;

-(NSString*) getNomAppellation:(NSInteger)idAoc
{
    NSString *aoc = [[[ListeVinsViewController alloc]init].appellations objectAtIndex:idAoc-1];
    
    return aoc;
}

@end
