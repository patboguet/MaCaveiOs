//
//  ListeVinsViewController.m
//  MaCaveiOs
//
//  Created by Patrick Boguet on 19/09/2015.
//  Copyright (c) 2015 Patrick Boguet. All rights reserved.
//


#import "ListeVinsViewController.h"
#import "VinsViewCell.h"
#import "DetailsVinViewController.h"
#import "Vin.h"
#import "Region.h"
#import "Appellation.h"
#import "Type.h"
#import "LieuAchat.h"
#import "Lieu Stockage.h"

@interface ListeVinsViewController ()

@end

@implementation ListeVinsViewController
@synthesize vins;
@synthesize regions;
@synthesize appellations;
@synthesize types;
@synthesize lieuxAchat;
@synthesize lieuxStockage;

- (void)viewDidLoad {
    self.title = @"Ma Cave";
    types = [[NSMutableArray alloc] initWithObjects:@"Blanc",@"Rouge",@"Rosé",@"Mousseux", nil];
    [self loadRegions];
    [self loadAppellations];
    [self loadLieuxStockage];
    [self loadLieuxAchat];
    [self loadVins];
    
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [vins count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"Cell";
    
    VinsViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if(cell == nil)
    {
        NSArray *objects = [[NSBundle mainBundle] loadNibNamed:@"VinsViewCell" owner:self options:nil];
        
        for(id currentObject in objects)
        {
            if([currentObject isKindOfClass:[UITableViewCell class]])
            {
                cell = (VinsViewCell *)currentObject;
                break;
            }
        }
    }
    
    Vin *vin = [vins objectAtIndex:indexPath.row];
    
    [cell setDetailsWithVin:vin];
    
    // Configure the cell...
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 130;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailsVinViewController *detail = [[DetailsVinViewController alloc] initWithNibName:@"DetailsVinViewController" bundle:nil];
    detail.vin = [vins objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:detail animated:YES];
}

- (void)loadVins;
{
    NSString *urlString = @"http://www.macaveonline.fr/webservice/webservice_select_vins.php?idUtilisateur=3";
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    self.vins = [[NSMutableArray alloc] init];
    
    for (NSDictionary *item in jsonArray) {
        Vin *vin = [[Vin alloc] init];
        
        NSInteger *idVin = (NSInteger*)[[item objectForKey:@"FK_vin"] integerValue];
        NSInteger *annee = (NSInteger*)[[item objectForKey:@"annee"] integerValue];
        NSString *region = [item objectForKey:@"FK_region"];
        NSString *appellation = [item objectForKey:@"FK_appellation"];
        NSString *type = [item objectForKey:@"FK_type"];
        NSString *degre = [item objectForKey:@"degre_alcool"];
        NSString *consoPartir = [item objectForKey:@"conso_partir"];
        NSString *consoAvant = [item objectForKey:@"conso_avant"];
        NSString *note = [item objectForKey:@"note"];
        NSInteger *nbBt = (NSInteger*)[[item objectForKey:@"nb_bouteilles"] integerValue];
        NSString *prix = [item objectForKey:@"prix_achat"];
        NSString *suivi_stock = [item objectForKey:@"suivi_stock"];
        NSString *meilleur_vin = [item objectForKey:@"meilleur_vin"];
        NSString *offert = [item objectForKey:@"offert_par"];
        NSString *commentaires = [item objectForKey:@"commentaires"];
        
        vin.idVin = idVin;
        vin.nom = [item objectForKey:@"nom"];
        vin.annee = annee;
        
        //NSString *reg = [[[Region alloc]init] getNomRegion:[region integerValue]];
        NSString *reg = [self getNomRegion:[region integerValue]];
        vin.region = reg;
        
        if([[NSNull null] isEqual:appellation])
        {
            vin.appellation = nil;
        }
        else {
            NSString *aoc = [self getNomAppellation:[appellation integerValue]];
            vin.appellation = aoc;
        }
        
        NSString *t = [self getNomType:[type integerValue]];
        vin.type = t;
        
        if([[NSNull null] isEqual:degre])
        {
            vin.degre = nil;
        }
        else {
            vin.degre = degre;
        }
        
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        [df setDateFormat:@"yyyy-MM-dd"];
        [df setTimeZone: [NSTimeZone timeZoneWithAbbreviation: @"GMT"]];
        
        if([[NSNull null] isEqual:consoAvant])
        {
            vin.consoAvant = nil;
        }
        else {
            vin.consoAvant = [df dateFromString: consoAvant];
        }
        if([[NSNull null] isEqual:consoPartir])
        {
            vin.consoPartir = nil;
        }
        else {
            vin.consoPartir = [df dateFromString: consoPartir];

        }
        
        if([[NSNull null] isEqual:note])
        {
            vin.note = nil;
        }
        else {
            vin.note = (NSInteger*)[note integerValue];
        }
        
        vin.nbBouteilles = nbBt;
        BOOL suivi = [suivi_stock boolValue];
        vin.suivi = &(suivi);
        BOOL favori =[meilleur_vin boolValue];
        vin.favori = &(favori);
        if([[NSNull null] isEqual:prix])
        {
            vin.prix = nil;
        }
        else {
            vin.prix = prix;
        }
        if([[NSNull null] isEqual:offert])
        {
            vin.offert = nil;
        }
        else {
            vin.offert = offert;
        }

        NSString *lieuAchat = [item objectForKey:@"FK_lieu_achat"];
        if([[NSNull null] isEqual:lieuAchat])
        {
            vin.lieuAchat = nil;
        }
        else {
            vin.lieuAchat = [self getNomLieuAchat:[lieuAchat integerValue]];
        }
        
        NSString *lieuStockage = [item objectForKey:@"FK_lieu_stockage"];
        if([[NSNull null] isEqual:lieuStockage])
        {
            vin.lieuStockage = nil;
        }
        else {
            vin.lieuStockage = [self getNomLieuStockage:[lieuStockage integerValue]];
        }
        
        if([[NSNull null] isEqual:commentaires])
        {
            vin.commentaires = nil;
        }
        else {
            vin.commentaires = commentaires;
        }
        
        [self.vins addObject:vin];
        
        [self.tableView reloadData];
    }
}

- (void) loadRegions;
{
    NSString *urlString = @"http://www.macaveonline.fr/webservice/webservice_select_regions.php?idUtilisateur=3";
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    self.regions = [[NSMutableArray alloc] init];
    
    for (NSDictionary *item in jsonArray) {
        Region *region = [[Region alloc] init];
        
        region.idRegion = (NSInteger*)[[item objectForKey:@"id_region"] integerValue];
        region.nom = [item objectForKey:@"region"];
    
        [regions addObject:region];
    }
}

-(void) loadAppellations;
{
    NSString *urlString = @"http://www.macaveonline.fr/webservice/webservice_select_aoc.php?idUtilisateur=3";
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    self.appellations = [[NSMutableArray alloc] init];
    
    for (NSDictionary *item in jsonArray) {
        Appellation *aoc = [[Appellation alloc] init];
        
        aoc.idAppellation = (NSInteger*)[[item objectForKey:@"id_appellation"] integerValue];
        aoc.nom = [item objectForKey:@"appellation"];
        
        [appellations addObject:aoc];
    }
}

-(void) loadLieuxAchat;
{
    NSString *urlString = @"http://www.macaveonline.fr/webservice/webservice_select_lieu_achat.php?idUtilisateur=3";
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    self.lieuxAchat = [[NSMutableArray alloc] init];
    
    for (NSDictionary *item in jsonArray) {
        LieuAchat *lieu = [[LieuAchat alloc] init];
        
        lieu.idLieu = (NSInteger*)[[item objectForKey:@"id_lieu_achat"] integerValue];
        lieu.nom = [item objectForKey:@"lieu_achat"];
        
        [lieuxAchat addObject:lieu];
    }
}

-(void) loadLieuxStockage;
{
    NSString *urlString = @"http://www.macaveonline.fr/webservice/webservice_select_lieu_stockage.php?idUtilisateur=3";
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    self.lieuxStockage = [[NSMutableArray alloc] init];
    
    for (NSDictionary *item in jsonArray) {
        Lieu_Stockage *lieu = [[Lieu_Stockage alloc] init];
        
        lieu.idLieu = (NSInteger*)[[item objectForKey:@"id_lieu_stockage"] integerValue];
        lieu.nom = [item objectForKey:@"lieu_stockage"];
        
        [lieuxStockage addObject:lieu];
    }
}

-(NSString*)getNomRegion:(NSInteger)idR
{
    Region *r = [[Region alloc] init];
    r = [self.regions objectAtIndex:(idR-1)];
    NSString *region = r.nom;
    
    return region;

}

-(NSString*) getNomAppellation:(NSInteger)idAoc
{
    NSString *aoc = [[[ListeVinsViewController alloc]init].appellations objectAtIndex:idAoc-1];
    
    return aoc;
}

-(NSString*) getNomType:(NSInteger)idT
{
    // l'id du vin ne correspond pas à l'index du tableau qui commence à 0
    NSString *type = [[ListeVinsViewController alloc].types objectAtIndex:idT-1];
    
    return type;
}

-(NSString*) getNomLieuAchat:(NSInteger)idL
{
    NSString *lieu = [[ListeVinsViewController alloc].lieuxAchat objectAtIndex:idL-1];
    
    return lieu;
}

-(NSString*) getNomLieuStockage:(NSInteger)idL
{
    NSString *lieu = [[ListeVinsViewController alloc].lieuxStockage objectAtIndex:idL-1];
    
    return lieu;
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
