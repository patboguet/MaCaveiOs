//
//  VinsViewCell.h
//  MaCaveiOs
//
//  Created by Patrick Boguet on 19/09/2015.
//  Copyright (c) 2015 Patrick Boguet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Vin.h"

@interface VinsViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nomVin;
@property (weak, nonatomic) IBOutlet UILabel *region;
@property (weak, nonatomic) IBOutlet UILabel *annee;
@property (weak, nonatomic) IBOutlet UILabel *nbBouteilles;
@property (weak, nonatomic) IBOutlet UIImageView *favori;
@property (weak, nonatomic) IBOutlet UIImageView *note;
@property (weak, nonatomic) IBOutlet UIStepper *plusmoins;

-(void)setDetailsWithVin:(Vin*)vin;


@end
