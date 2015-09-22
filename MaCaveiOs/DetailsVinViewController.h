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

@property (weak, nonatomic) IBOutlet UILabel *labelNom;
@property (weak, nonatomic) IBOutlet UILabel *labelAnnee;
@property (weak, nonatomic) IBOutlet UILabel *labelRegion;
@property (weak, nonatomic) IBOutlet UILabel *labelAppellation;
@property (weak, nonatomic) IBOutlet UILabel *labelType;
@property (weak, nonatomic) IBOutlet UILabel *labelDegre;
@property (weak, nonatomic) IBOutlet UILabel *labelConsoPartir;
@property (weak, nonatomic) IBOutlet UILabel *labelConsoAvant;
@property (weak, nonatomic) IBOutlet UILabel *labelNote;
@property (weak, nonatomic) IBOutlet UILabel *labelBouteilles;
@property (weak, nonatomic) IBOutlet UILabel *labelSuivi;
@property (weak, nonatomic) IBOutlet UILabel *labelFavori;
@property (weak, nonatomic) IBOutlet UILabel *labelPrix;
@property (weak, nonatomic) IBOutlet UILabel *labelOffert;
@property (weak, nonatomic) IBOutlet UILabel *labelLieuAchat;
@property (weak, nonatomic) IBOutlet UILabel *labelLieuStockage;
@property (weak, nonatomic) IBOutlet UILabel *labelCommentaires;
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

- (IBAction)updateNbBt:(UIStepper*)sender;


@end
