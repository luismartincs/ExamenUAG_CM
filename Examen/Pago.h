//
//  Pago.h
//  Examen
//
//  Created by Luis de Jesus Martin Castillo on 27/08/16.
//  Copyright © 2016 Luis de Jesus Martin Castillo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Pago : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong,nonatomic) NSString *imagePath;
@property (nonatomic) NSInteger price;

- (IBAction)cancelar:(id)sender;
- (IBAction)pagar:(id)sender;

@end
