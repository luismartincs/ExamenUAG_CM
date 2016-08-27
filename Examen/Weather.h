//
//  WeatherObject.h
//  Examen
//
//  Created by Luis de Jesus Martin Castillo on 27/08/16.
//  Copyright © 2016 Luis de Jesus Martin Castillo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Weather : NSObject


@property (nonatomic) NSInteger *id;
@property (nonatomic,strong) NSString *main;
@property (nonatomic,strong) NSString *descriptions;
@property (nonatomic,strong) NSString *icon;


@end
