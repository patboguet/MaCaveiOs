//
//  VinsViewCell.m
//  MaCaveiOs
//
//  Created by Patrick Boguet on 19/09/2015.
//  Copyright (c) 2015 Patrick Boguet. All rights reserved.
//

#import "VinsViewCell.h"

@implementation VinsViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setDetailsWithVin:(Vin*)vin
{
    _nomVin.text = vin.nom;
    _region.text = vin.region;
    _annee.text = [NSString stringWithFormat:@"%d", vin.annee];
    _nbBouteilles.text = [NSString stringWithFormat:@"%d", vin.nbBouteilles];
    UIImage *image = [[UIImage alloc]init];
    if(vin.favori)
    {
        image = [UIImage imageNamed:@"ic_favori_oui-web.png"];
    }
    else {
        image = [UIImage imageNamed:@"ic_favori_no-web.png"];
    }
    _favori.image = image;
}

@end
