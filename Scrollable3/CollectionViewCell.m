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
  return self;
}
@end
