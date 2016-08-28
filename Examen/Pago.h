//
//  Pago.h
//  Examen
//
//  Created by Luis de Jesus Martin Castillo on 27/08/16.
//  Copyright © 2016 Luis de Jesus Martin Castillo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PayPalMobile.h"

@interface Pago : UIViewController <PayPalPaymentDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong,nonatomic) NSString *imagePath;
@property (strong,nonatomic) NSString *name;
@property (nonatomic) NSInteger price;

- (IBAction)cancelar:(id)sender;
- (IBAction)pagar:(id)sender;

@end
