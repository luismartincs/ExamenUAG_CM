//
//  cellProduct.h
//  Examen
//
//  Created by Luis de Jesus Martin Castillo on 27/08/16.
//  Copyright © 2016 Luis de Jesus Martin Castillo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellProductDelegate.h"

@interface cellProduct : UITableViewCell

@property (strong,nonatomic) id<CellProductDelegate> delegate;
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UILabel *product;
@property (strong, nonatomic) IBOutlet UILabel *price;
@property (nonatomic) NSInteger index;

- (IBAction)buy:(id)sender;
@end
