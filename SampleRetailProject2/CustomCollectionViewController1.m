//
//  CustomCollectionViewController1.m
//  SampleRetailProject2
//
//  Created by Quazi Ridwan Hasib on 30/01/2016.
//  Copyright © 2016 Quazi Ridwan Hasib. All rights reserved.
//

#import "CustomCollectionViewController1.h"
#import "CustomCollectionViewCell1.h"
#import "CustomHeader1.h"
#import "JsonData.h"

@interface CustomCollectionViewController1 ()
{
    UIActivityIndicatorView *indicator;
    NSArray *a;
    NSMutableArray *arrayName;
    NSMutableArray *arrayImage;
}
@end

@implementation CustomCollectionViewController1


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    self.dataArray = @[@"Jan", @"Feb", @"Mar", @"Apr", @"May", @"Jun", @"Jul", @"Aug", @"Sep",
                       @"Oct", @"Nov", @"Dec"];
    
    self.dataArray1 = @[ @"May", @"Jun", @"Jul", @"Aug", @"Sep",
                         @"Oct", @"Nov", @"Dec"];
    
    self.dataArray2 = @[@"Oct", @"Nov", @"Dec"];
    
    a = getData();
    
    arrayName = [NSMutableArray arrayWithObjects:[a valueForKey:@"name"],nil];
    NSLog(@"TheTextsss = %@", arrayName);
    
    NSString *arrayLength = [arrayName objectAtIndex:0];
    NSLog(@"sdsd:%@", arrayLength);
    
    //count multi dimentional array
//    NSArray *counts = [arrayName valueForKeyPath:@"@unionOfObjects.@count"];
//     NSLog(@"TheTextsss = %@", counts);
//    NSLog(@"nnn %ld", ((NSArray*)arrayName[0]).count);
    
    arrayImage = [NSMutableArray arrayWithObjects:[a valueForKey:@"image"],nil];
    NSLog(@"TheTextsa = %@", arrayImage);
  
//    //show loader view
//    indicator = [[UIActivityIndicatorView alloc]initWithFrame: CGRectMake(round((self.view.frame.size.width - 25) / 2), round((self.view.frame.size.height - 25) / 2), 25, 25)];
//    //indicator.center = self.view.center;
//    [indicator setBackgroundColor:[UIColor clearColor]];
//    [indicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
//    [self.view addSubview:indicator];
//    //[indicator release];
//    
//    
//    [indicator startAnimating];
    
     [self.collectionView reloadData];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)collectionView
{
    return 3;
}

-(NSInteger)collectionView:(UICollectionView*)collectionView numberOfItemsInSection:(NSInteger)section
{
    int a;
    if(section==0)
    {
        a=((NSArray*)arrayName[0]).count;
    }
    else if(section==1)
    {
        a=self.dataArray1.count;
    }
    else if(section==2)
    {
        a=self.dataArray2.count;
    }
    
    return a;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    CustomHeader1 *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header1" forIndexPath:indexPath];
    
    if (indexPath.section ==0) {
        header.headerLabel1.text = [NSString stringWithFormat:@"Section 0"];
        
    }
    else if (indexPath.section ==1) {
        header.headerLabel1.text = [NSString stringWithFormat:@"Section ss"];
        
    }
    else if (indexPath.section ==2) {
        header.headerLabel1.text = [NSString stringWithFormat:@"Section dd"];
        
    }
    
    // header.myHeaderLabel.text = [NSString stringWithFormat:@"Section %ld", indexPath.section +1];
    
    return header;
}


-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cell1";
    
    CustomCollectionViewCell1 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if(indexPath.section==0)
    {
        cell.labelCell1.text =  arrayName[0][indexPath.row];
        NSString *bildurl = arrayImage[0][indexPath.row];
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:bildurl]]];

        
        cell.imageViewCell1.image = image;
        
        //Add to cell programmatically
        //        UILabel *lbl1 = [[UILabel alloc] init];
        //        [lbl1 setFrame:CGRectMake(0,5,100,20)];
        //        lbl1.backgroundColor=[UIColor clearColor];
        //        lbl1.textColor=[UIColor blueColor];
        //        lbl1.userInteractionEnabled=YES;
        //        [cell addSubview:lbl1];
        //        lbl1.text=  [self.dataArray objectAtIndex:indexPath.item];
        
        //Remove from cell programmatically
        //  [cell.myLabel removeFromSuperview];
        
    }
    else if(indexPath.section==1)
    {
        [[cell labelCell1]setText:[self.dataArray1 objectAtIndex:indexPath.item]];
        cell.imageViewCell1.image = [UIImage imageNamed:@"2.jpg"];
    }
    else if(indexPath.section==2)
    {
        [[cell labelCell1]setText:[self.dataArray2 objectAtIndex:indexPath.item]];
        cell.imageViewCell1.image = [UIImage imageNamed:@"4.jpg"];
    }
    
    //[indicator stopAnimating];
    
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCollectionViewCell1 *cell = (CustomCollectionViewCell1 *)[collectionView cellForItemAtIndexPath:indexPath];
    if (indexPath.section == 0) {
        
        NSString *str = cell.labelCell1.text;
        NSLog(@"Text: %@ section no:%ld item no: %ld", str, indexPath.item, indexPath.section);
        
    } else if(indexPath.section == 1){
        NSString *str = cell.labelCell1.text;
        NSLog(@"Text: %@ section no:%ld item no: %ld", str, indexPath.item, indexPath.section);
    }
    else if(indexPath.section == 2){
        NSString *str = cell.labelCell1.text;
        NSLog(@"Text: %@ section no:%ld item no: %ld", str, indexPath.item, indexPath.section);
    }
}

//#pragma mark collection view cell paddings
//- (UIEdgeInsets)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
//    return UIEdgeInsetsMake(0, 0, 0, 0); // top, left, bottom, right
//}
//
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
//    
//    return 35.0;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
