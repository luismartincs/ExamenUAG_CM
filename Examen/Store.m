//
//  SecondViewController.m
//  Examen
//
//  Created by Luis de Jesus Martin Castillo on 26/08/16.
//  Copyright © 2016 Luis de Jesus Martin Castillo. All rights reserved.
//

#import "Store.h"
#import "cellProduct.h"
#import "Pago.h"

@interface Store ()

@property NSArray *items;
@property NSArray *prices;
@property NSArray *images;
@property NSInteger index;

@end

@implementation Store

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self config];
}

-(void)config{
 
    _items = [NSArray arrayWithObjects:@"Macbook Pro Retina 13",@"Apple Watch Sport",@"Apple Iphone 6s",@"Apple Tv 3ra Generación",@"Apple Macbook Air",@"Arduino Nano",@"Arduino Uno",@"Arduino Mega",@"Raspberry Pi 3 Model B",@"Beagle Bone Black",nil];
    _prices = [NSArray arrayWithObjects:@"22500",@"5900",@"14700",@"1700",@"15500",@"170",@"70",@"300",@"1100",@"1250",nil];
    _images = [NSArray arrayWithObjects:@"item1.jpeg",@"item2.jpeg",@"item3.png",@"item4.png",@"item5.jpg",@"item6.jpg",@"item7.jpg",@"item8.jpg",@"item9.jpg",@"item10.jpg", nil];
    
}

#pragma  mark - Delegates

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_items count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    //1. Setup the CATransform3D structure
    CATransform3D rotation;
    rotation = CATransform3DMakeRotation( (90.0*M_PI)/180, 0.0, 0.7, 0.4);
    rotation.m34 = 1.0/ -600;
    
    //2. Define the initial state (Before the animation)
    cell.layer.shadowColor = [[UIColor blackColor]CGColor];
    cell.layer.shadowOffset = CGSizeMake(10, 10);
    cell.alpha = 0;
    
    cell.layer.transform = rotation;
    cell.layer.anchorPoint = CGPointMake(0, 0.5);
    
    //3. Define the final state (After the animation) and commit the animation
    [UIView beginAnimations:@"rotation" context:NULL];
    [UIView setAnimationDuration:0.4];
    cell.layer.transform = CATransform3DIdentity;
    cell.alpha = 1;
    cell.layer.shadowOffset = CGSizeMake(0, 0);
    
    //Reassure that cell its in its place (WaGo)
    cell.frame = CGRectMake(0, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height);
    [UIView commitAnimations];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    cellProduct *cell = (cellProduct*)[tableView dequeueReusableCellWithIdentifier:@"cellProduct"];
    
    if (cell == nil) {
        
        [tableView registerNib:[UINib nibWithNibName:@"cellProduct" bundle:nil] forCellReuseIdentifier:@"cellProduct"];
        
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellProduct"];
    }
    
    
    NSNumber *price = [NSNumber numberWithInt:[_prices[indexPath.row] integerValue]];
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle: NSNumberFormatterCurrencyStyle];
    NSString *numberAsString = [numberFormatter stringFromNumber:price];
    
    cell.delegate = self;
    cell.product.text = _items[indexPath.row];
    cell.price.text = numberAsString;
    cell.image.image = [UIImage imageNamed:_images[indexPath.row]];
    cell.index = indexPath.row;

    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  
}

-(void)touchBuy:(id)source{
    _index = ((cellProduct*)source).index;
    [self performSegueWithIdentifier:@"Pago" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.destinationViewController isKindOfClass:[Pago class]]){
        
        NSLog(@"%i",_index);
        
        Pago *pagar = [segue destinationViewController];
        
        pagar.imagePath = _images[_index];
        pagar.price = [_prices[_index] integerValue];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
