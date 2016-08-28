//
//  Pago.m
//  Examen
//
//  Created by Luis de Jesus Martin Castillo on 27/08/16.
//  Copyright © 2016 Luis de Jesus Martin Castillo. All rights reserved.
//

#import "Pago.h"

@interface Pago ()

@end

@implementation Pago

- (void)viewDidLoad {
    [super viewDidLoad];
    [self config];
}

-(void)config{
    _image.image = [UIImage imageNamed:_imagePath];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)cancelar:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)pagar:(id)sender {
}
@end
