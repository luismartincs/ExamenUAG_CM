//
//  MainObject.h
//  WebServices
//
//  Created by Luis de Jesus Martin Castillo on 05/08/16.
//  Copyright © 2016 Luis de Jesus Martin Castillo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainObject : NSObject

@property (nonatomic) float temp;
@property (nonatomic) float pressure;
@property (nonatomic) float humidity;
@property (nonatomic) double temp_min;
@property (nonatomic) double temp_max;
@end
