//
//  LieuAchat.h
//  MaCaveiOs
//
//  Created by Patrick Boguet on 19/09/2015.
//  Copyright (c) 2015 Patrick Boguet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LieuAchat : NSObject

@property NSInteger *idLieu;
@property NSString *nom;

-(NSString*) getNomLieuAchat:(NSInteger)idLieu;

@end
