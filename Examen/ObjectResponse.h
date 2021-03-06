//
//  ObjectResponse.h
//  WebServices
//
//  Created by Luis de Jesus Martin Castillo on 15/07/16.
//  Copyright © 2016 Luis de Jesus Martin Castillo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Coord.h"
#import "MainObject.h"
#import "Weather.h"

@interface ObjectResponse : NSObject

@property (nonatomic,strong) Coord *coord;
@property (nonatomic,strong) Weather *weather;
@property (nonatomic,strong) MainObject *main;
@property (nonatomic,strong) NSString *name;
@end
