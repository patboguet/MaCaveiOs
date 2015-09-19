//
//  Lieu Stockage.m
//  MaCaveiOs
//
//  Created by Patrick Boguet on 19/09/2015.
//  Copyright (c) 2015 Patrick Boguet. All rights reserved.
//

#import "Lieu Stockage.h"
#import "ListeVinsViewController.h"

@implementation Lieu_Stockage

@synthesize idLieu,nom;

-(NSString*) getNomLieuStockage:(NSInteger)idL
{
    NSString *lieu = [[ListeVinsViewController alloc].lieuxStockage objectAtIndex:idL-1];
    
    return lieu;
}

@end
