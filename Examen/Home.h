//
//  FirstViewController.h
//  Examen
//
//  Created by Luis de Jesus Martin Castillo on 26/08/16.
//  Copyright © 2016 Luis de Jesus Martin Castillo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>

@import GoogleMaps;

@interface Home : UIViewController<GMSMapViewDelegate>

@property(nonatomic,strong) GMSMapView *mapView;
@property(nonatomic,strong) GMSMarker *marker;

@end

