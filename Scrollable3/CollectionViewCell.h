//
//  CollectionViewCell.h
//  Scrollable3
//
//  Created by Emily Chen on 7/11/18.
//  Copyright © 2018 Emily Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCell : UICollectionViewCell
//@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *channelName;
-(void) setup;
@end
