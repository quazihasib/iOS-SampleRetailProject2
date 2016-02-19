//
//  ViewController.m
//  SampleRetailProject2
//
//  Created by Quazi Ridwan Hasib on 30/01/2016.
//  Copyright © 2016 Quazi Ridwan Hasib. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)firstBtn:(id)sender {
    ViewController *NVC = [self.storyboard instantiateViewControllerWithIdentifier:@"CollectionView"];
    [self presentViewController:NVC animated:YES completion:nil];
}
@end
