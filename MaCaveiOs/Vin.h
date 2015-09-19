//
//  Vin.h
//  MaCaveiOs
//
//  Created by Patrick Boguet on 19/09/2015.
//  Copyright (c) 2015 Patrick Boguet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Vin : NSObject

@property NSInteger *idVin;
@property NSString *nom;
@property NSInteger *annee;
@property NSString *region;
@property NSString *appellation;
@property NSString *type;
@property NSString *degre;
@property NSDate *consoPartir;
@property NSDate *consoAvant;
@property NSInteger *note;
@property NSInteger *nbBouteilles;
@property Boolean *suivi;
@property Boolean *favori;
@property NSString *prix;
@property NSString *offert;
@property NSString *lieuAchat;
@property NSString *lieuStockage;
@property NSString *commentaires;

@end
