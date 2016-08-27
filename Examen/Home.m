//
//  FirstViewController.m
//  Examen
//
//  Created by Luis de Jesus Martin Castillo on 26/08/16.
//  Copyright © 2016 Luis de Jesus Martin Castillo. All rights reserved.
//

#import "Home.h"
#import "WeatherController.h"

@interface Home ()

@end

@implementation Home

- (void)viewDidLoad {
    [super viewDidLoad];

    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:20.693940
                                                            longitude:-103.417697
                                                                 zoom:15];
    _mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    _mapView.myLocationEnabled = YES;
    _mapView.delegate = self;


    self.view = _mapView;
    
    // Creates a marker in the center of the map.
    _marker = [[GMSMarker alloc] init];
    _marker.position = CLLocationCoordinate2DMake(20.693940,-103.417697);
    _marker.title = @"UAG";
    _marker.snippet = @"México";
    _marker.icon = [GMSMarker markerImageWithColor:[UIColor blueColor]];
    _marker.map = _mapView;
    
    
}

#pragma mark - GMSMapViewDelegate

- (void)mapView:(GMSMapView *)mapView didTapAtCoordinate:(CLLocationCoordinate2D)coordinate {
    NSLog(@"You tapped at %f,%f", coordinate.latitude, coordinate.longitude);
    
    NSString *datos = [NSString stringWithFormat:@"Lat: %.6f, Lon: %.6f ",coordinate.latitude,coordinate.longitude];
    
    _marker.position = coordinate;
    _marker.title = @"Ubicación";
    _marker.snippet = datos;
    _mapView.selectedMarker = _marker;
}

- (void)mapView:(GMSMapView *)mapView didTapInfoWindowOfMarker:(GMSMarker *)marker {
    
    _selectedCoord = marker.position;
    
    [self performSegueWithIdentifier:@"Temp" sender:self];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.destinationViewController isKindOfClass:[WeatherController class]]){
        
        WeatherController *destination = [segue destinationViewController];
        
        destination.latitude = [NSString stringWithFormat:@"%f",_selectedCoord.latitude];
        destination.longitude = [NSString stringWithFormat:@"%f",_selectedCoord.longitude];
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
