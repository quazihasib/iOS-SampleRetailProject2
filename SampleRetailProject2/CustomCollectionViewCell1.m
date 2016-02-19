//
//  CustomCollectionViewCell1.m
//  SampleRetailProject2
//
//  Created by Quazi Ridwan Hasib on 30/01/2016.
//  Copyright © 2016 Quazi Ridwan Hasib. All rights reserved.
//

#import "CustomCollectionViewCell1.h"

@implementation CustomCollectionViewCell1


-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if(self)
    {
        self.imageViewCell1 = [[UIImageView alloc] initWithFrame:frame];
        self.imageViewCell1.contentMode = UIViewContentModeScaleAspectFill;
        
        [self.contentView addSubview:self.imageViewCell1];
    }
    
    return self;
}


@end
