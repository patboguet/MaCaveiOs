//
//  DetailsVinViewController.h
//  MaCaveiOs
//
//  Created by Patrick Boguet on 19/09/2015.
//  Copyright (c) 2015 Patrick Boguet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Vin.h"

@interface DetailsVinViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *nomVin;
@property (weak, nonatomic) IBOutlet UILabel *anneeVin;
@property (weak, nonatomic) IBOutlet UILabel *regionVin;
@property (weak, nonatomic) IBOutlet UILabel *aocVin;
@property (weak, nonatomic) IBOutlet UILabel *typeVin;
@property (weak, nonatomic) IBOutlet UILabel *degreVin;
@property (weak, nonatomic) IBOutlet UILabel *consoPartirVin;
@property (weak, nonatomic) IBOutlet UILabel *consoAvantVin;
@property (weak, nonatomic) IBOutlet UISlider *noteVin;
@property (weak, nonatomic) IBOutlet UILabel *nbBtVin;
@property (weak, nonatomic) IBOutlet UIStepper *plusMoins;
@property (weak, nonatomic) IBOutlet UISwitch *suiviVin;
@property (weak, nonatomic) IBOutlet UISwitch *favoriVin;
@property (weak, nonatomic) IBOutlet UILabel *prixVin;
@property (weak, nonatomic) IBOutlet UILabel *offertVin;
@property (weak, nonatomic) IBOutlet UILabel *lieuAchatVin;
@property (weak, nonatomic) IBOutlet UILabel *lieuStockageVin;
@property (weak, nonatomic) IBOutlet UITextView *commentairesVin;
@property (weak, nonatomic) IBOutlet UIButton *modifier;
@property (weak, nonatomic) IBOutlet UIButton *supprimer;
@property (nonatomic, retain) Vin *vin;

@end
