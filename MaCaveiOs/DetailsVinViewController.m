//
//  DetailsVinViewController.m
//  MaCaveiOs
//
//  Created by Patrick Boguet on 19/09/2015.
//  Copyright (c) 2015 Patrick Boguet. All rights reserved.
//

#import "DetailsVinViewController.h"

@interface DetailsVinViewController ()
@end

@implementation DetailsVinViewController
@synthesize scrollView;
@synthesize labelNom,labelAnnee,labelAppellation,labelBouteilles,labelCommentaires,labelConsoAvant,labelConsoPartir,labelDegre,labelFavori,labelLieuAchat,labelLieuStockage,labelNote,labelOffert,labelPrix,labelRegion,labelSuivi,labelType;
@synthesize nomVin,anneeVin,regionVin,aocVin,typeVin,degreVin,consoAvantVin,commentairesVin,consoPartirVin,noteVin,nbBtVin,plusMoins,suiviVin,favoriVin,prixVin,offertVin,lieuAchatVin,lieuStockageVin,modifier,supprimer,vin;

- (void)viewDidLoad {
    
    self.nomVin.text = vin.nom;
    self.anneeVin.text = [NSString stringWithFormat:@"%d", (int)vin.annee];
    self.regionVin.text = vin.region;
    self.aocVin.text = vin.appellation;
    self.typeVin.text = vin.type;
    self.degreVin.text = vin.degre;
    // Formatage de la date
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM/yyyy"];
    self.consoAvantVin.text = [formatter stringFromDate:vin.consoAvant];
    self.consoPartirVin.text = [formatter stringFromDate:vin.consoPartir];
    self.commentairesVin.text = vin.commentaires;
    NSInteger note = (int)vin.note;
    [self.noteVin setValue:(float)note animated:true];
    self.nbBtVin.text = [NSString stringWithFormat:@"%02d",(int)vin.nbBouteilles];
    [self.suiviVin setOn:vin.suivi animated:true];
    [self.favoriVin setOn:vin.favori animated:true];
    self.prixVin.text = vin.prix;
    self.offertVin.text = vin.offert;
    self.lieuAchatVin.text = vin.lieuAchat;
    self.lieuStockageVin.text = vin.lieuStockage;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    // on assigne la valeur de départ du stepper
    plusMoins.value = [self.nbBtVin.text doubleValue];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

// on affiche la nouvelle valeur du nombre de bouteilles dans le champ texte
- (IBAction)updateNbBt:(UIStepper*)sender {
    // BUG : sender.value = 0 tout le temps au début
    NSLog(@"PlusMoins%1f", plusMoins.value);
    NSLog(@"Stepper%1f", sender.value);
    
    //self.nbBtVin.text = [NSString stringWithFormat:@"%1.0f", sender.value];
}


@end
