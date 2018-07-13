//
//  CollectionViewCell.m
//  Scrollable3
//
//  Created by Emily Chen on 7/11/18.
//  Copyright © 2018 Emily Chen. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    [self setBackgroundColor:UIColor.whiteColor];
    self.layer.borderColor = (__bridge CGColorRef _Nullable)([UIColor blackColor]);
  }
  [self setup];
  return self;
}

-(void)setup{
  self.layer.borderWidth = 1.0f;
  self.layer.borderColor = [UIColor blackColor].CGColor;
  self.layer.backgroundColor = [UIColor whiteColor].CGColor;
  self.layer.cornerRadius = 5.0f;
  
  
}

@end
