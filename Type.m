//
//  Type.m
//  MaCaveiOs
//
//  Created by Patrick Boguet on 19/09/2015.
//  Copyright (c) 2015 Patrick Boguet. All rights reserved.
//

#import "Type.h"
#import "ListeVinsViewController.h"

@implementation Type

@synthesize idType,nom;

-(NSString*) getNomType:(NSInteger)idT
{
    // l'id du vin ne correspond pas à l'index du tableau qui commence à 0
    NSString *type = [[ListeVinsViewController alloc].types objectAtIndex:idT-1];
    
    return type;
}

@end
