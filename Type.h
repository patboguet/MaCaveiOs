//
//  Type.h
//  MaCaveiOs
//
//  Created by Patrick Boguet on 19/09/2015.
//  Copyright (c) 2015 Patrick Boguet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Type : NSObject

@property NSInteger *idType;
@property NSString *nom;

-(NSString*) getNomType:(NSInteger)idType;

@end
