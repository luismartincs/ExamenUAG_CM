//
//  Weather.m
//  Examen
//
//  Created by Luis de Jesus Martin Castillo on 27/08/16.
//  Copyright © 2016 Luis de Jesus Martin Castillo. All rights reserved.
//

#import "WeatherController.h"

@interface WeatherController ()

@end

@implementation WeatherController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [self queueLoadData];
}


#pragma mark - Load Data

-(void)queueLoadData{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [_indicator startAnimating];
    
    NSOperationQueue *queue = [NSOperationQueue new];
    
    NSInvocationOperation *opGet = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(loadData) object:nil];
    
    [queue addOperation:opGet];
    
    NSInvocationOperation *opDidGet = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(didLoadData) object:nil];
    
    [opDidGet addDependency:opGet];
    
    [queue addOperation:opDidGet];
    
    
}

-(void)loadData{
    mjsonGeo = [WebServices getWeatherWithLatitude:_latitude AndLongitude:_longitude];
    //print(NSLog(@"mjsonGeo  = %@",mjsonGeo))
    
}

-(void)didLoadData{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        ObjectResponse *object  = [Parser parseGeoObject];
        Coord *coordObject      = object.coord;
        float lat               = coordObject.lat;
        float lng               = coordObject.lon;
        NSString *stName        = object.name;
        
        //NSLog(@"%@",[object.weather valueForKey:@"icon"][0]);

        
        _iconUrl = [NSString stringWithFormat:@"http://openweathermap.org/img/w/%@.png",[object.weather valueForKey:@"icon"][0]];
        
        
        MainObject *main = object.main;
        
        _nombre.text = stName;
        _coords.text = [NSString stringWithFormat:@"(%@,%@)",_latitude,_longitude];
        _hum.text = [NSString stringWithFormat:@"%i",(int)main.humidity];
        _tempMax.text = [NSString stringWithFormat:@"%i ºC",(int)main.temp_max];
        _tempMin.text = [NSString stringWithFormat:@"%i ºC",(int)main.temp_min];
        
        
        [self loadIcon];
        
        print(NSLog(@"We are at %@ with latitude %f and longitude %f",stName, lat, lng));
        
    });
}

-(void)loadIcon{
    
    NSLog(@"Load %@",_iconUrl);

    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:_iconUrl]];
        if ( data == nil )
            return;
        dispatch_async(dispatch_get_main_queue(), ^{
            _icon.image = [UIImage imageWithData: data];
            [_indicator stopAnimating];
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        });
    });
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)aceptar:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
