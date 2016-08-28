//
//  cellProduct.m
//  Examen
//
//  Created by Luis de Jesus Martin Castillo on 27/08/16.
//  Copyright © 2016 Luis de Jesus Martin Castillo. All rights reserved.
//

#import "cellProduct.h"

@implementation cellProduct

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.layer.masksToBounds = NO;
    self.layer.shadowOffset = CGSizeMake(-10, 10);
    self.layer.shadowRadius = 5;
    self.layer.shadowOpacity = 0.5;}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)buy:(id)sender {
    [_delegate touchBuy:self];
}
@end
