//
//  Test.m
//  SampleRetailProject2
//
//  Created by Quazi Ridwan Hasib on 30/01/2016.
//  Copyright © 2016 Quazi Ridwan Hasib. All rights reserved.
//

#import <Foundation/Foundation.h>



#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) //1
#define kLatestKivaLoansURL [NSURL URLWithString:@"http://www.quaziridwanhasib.com/imageData.php"]



NSArray *getData()
{
    NSError* error;
    NSData* data = [NSData dataWithContentsOfURL: kLatestKivaLoansURL];
    
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data
                                                         options:kNilOptions
                                                           error:&error];
    
    
    //NSArray* latestLoan = [json objectForKey:@"loans"];
    //NSLog(@"mmm:%@",json);
    
    NSArray* latestLoan = [json objectForKey:@"result"];
    
//    NSMutableArray *arrayName;
//    arrayName = [NSMutableArray arrayWithObjects:[latestLoan valueForKey:@"name"],nil];
//    NSLog(@"TheText = %@", arrayName);
//    
//    NSMutableArray *arrayImage;
//    arrayImage = [NSMutableArray arrayWithObjects:[latestLoan valueForKey:@"image"],nil];
//    NSLog(@"TheText = %@", arrayImage);
    
    return latestLoan;
}