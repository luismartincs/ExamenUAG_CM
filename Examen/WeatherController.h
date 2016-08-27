//
//  Weather.h
//  Examen
//
//  Created by Luis de Jesus Martin Castillo on 27/08/16.
//  Copyright © 2016 Luis de Jesus Martin Castillo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebServices.h"
#import "Declarations.h"

@interface WeatherController : UIViewController

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *indicator;
@property (nonatomic,strong) NSString *latitude;
@property (nonatomic,strong) NSString *longitude;
@property (nonatomic,strong) NSString *iconUrl;


@property (strong, nonatomic) IBOutlet UILabel *nombre;
@property (strong, nonatomic) IBOutlet UILabel *coords;
@property (strong, nonatomic) IBOutlet UILabel *tempMax;
@property (strong, nonatomic) IBOutlet UILabel *tempMin;
@property (strong, nonatomic) IBOutlet UILabel *hum;

@property (strong, nonatomic) IBOutlet UIImageView *icon;

- (IBAction)aceptar:(id)sender;

@end
