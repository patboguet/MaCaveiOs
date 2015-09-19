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
@synthesize nomVin,anneeVin,regionVin,aocVin,typeVin,degreVin,consoAvantVin,commentairesVin,consoPartirVin,noteVin,nbBtVin,plusMoins,suiviVin,favoriVin,prixVin,offertVin,lieuAchatVin,lieuStockageVin,modifier,supprimer,vin;

- (void)viewDidLoad {
    
    nomVin.text = vin.nom;
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

@end
