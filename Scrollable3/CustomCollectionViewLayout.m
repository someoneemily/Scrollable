//
//  CustomCollectionViewLayout.m
//  Scrollable3
//
//  Created by Emily Chen on 7/11/18.
//  Copyright © 2018 Emily Chen. All rights reserved.
//

#import "CustomCollectionViewLayout.h"

@implementation CustomCollectionViewLayout
CGFloat CELL_HEIGHT = 30.0;
CGFloat CELL_WIDTH = 100.0;
NSMutableDictionary *cellAttributesDict;
CGSize contentSize;
Boolean dataSourceDidUpdate = true;
- (CGSize)collectionViewContentSize{
  return contentSize;
}
- (void)prepareLayout{
  if(!dataSourceDidUpdate){
    NSLog(@"updating again %d", 1);
    CGFloat yOffSet = self.collectionView.contentOffset.y;
    CGFloat xOffSet = self.collectionView.contentOffset.x;
    if(self.collectionView.numberOfSections>0){
      
      if([self.collectionView numberOfItemsInSection:0]>0){
        
        //for horizontal header
        for(int item = 0; item<[self.collectionView numberOfItemsInSection:0]; item++){
          NSIndexPath *cellIndex = [NSIndexPath indexPathForItem:item inSection:0];
          UICollectionViewLayoutAttributes *attr = [cellAttributesDict objectForKey:[NSIndexPath indexPathForItem:item inSection:0]];
          CGFloat xPos = attr.frame.origin.x;
          CGFloat yPos = yOffSet;
          
          if(item == 0){
            xPos = xOffSet;
          }
          //attr.frame.origin.x = xOffSet + item*CELL_WIDTH;
          NSLog(@"There is something %@", attr);
          attr.frame = CGRectMake(xPos, yPos, CELL_WIDTH, CELL_HEIGHT);
          
          [cellAttributesDict setValue:attr forKey:cellIndex];
        }
        
        //for vertical header
        for (int section = 1; section<self.collectionView.numberOfSections; section++){
          NSIndexPath *cellIndex = [NSIndexPath indexPathForItem:0 inSection:section];
          CGFloat xPos = xOffSet;
          
          UICollectionViewLayoutAttributes *attr = [cellAttributesDict objectForKey:[NSIndexPath indexPathForItem:0 inSection:section]];
          CGFloat yPos = attr.frame.origin.y;
           NSLog(@"There is something %@", attr);
          attr.frame = CGRectMake(xPos, yPos, CELL_WIDTH, CELL_HEIGHT);
          
          [cellAttributesDict setValue:attr forKey:cellIndex];
        }
      }
    }
    
  }else{
    dataSourceDidUpdate = false;
    
    cellAttributesDict = [[NSMutableDictionary alloc] init];
    if(self.collectionView.numberOfSections>0){
      for(int section = 0; section<self.collectionView.numberOfSections; section++){
        
        if([self.collectionView numberOfItemsInSection:section] > 0){
          for (int item = 0; item<[self.collectionView numberOfItemsInSection:section]; item++){
           
            NSIndexPath *cellIndex = [NSIndexPath indexPathForItem:item inSection:section];
            CGFloat xPos = item*CELL_WIDTH;
            CGFloat yPos = section*CELL_HEIGHT;
            
            UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:cellIndex];
            attr.frame = CGRectMake(xPos, yPos, CELL_WIDTH, CELL_HEIGHT);
            
            [cellAttributesDict setValue:attr forKey:cellIndex];
            
          }
        }
        
        CGFloat contentWidth = [self.collectionView numberOfItemsInSection:0]*CELL_WIDTH;
        CGFloat contentHeight = [self.collectionView numberOfSections]*CELL_HEIGHT;
        contentSize = CGSizeMake(contentWidth, contentHeight);
        
      }
    }
  }
}
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
  return [cellAttributesDict objectForKey:indexPath];
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
  NSMutableArray *attributesInRect = [[NSMutableArray alloc] init];
  //NSLog(@"These are the new bounds %@", NSStringFromCGRect(rect));
  for(NSIndexPath *indexPath in cellAttributesDict){
    UICollectionViewLayoutAttributes *attributes = [cellAttributesDict objectForKey:indexPath];
    if(CGRectIntersectsRect(rect, attributes.frame)){
      [attributesInRect addObject:attributes];
      
    }
  }
  return attributesInRect;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
  return YES;
}

@end
