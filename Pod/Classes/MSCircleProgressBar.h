//
//  MSCircleProgressBar.h
//  Pods
//
//  Created by Nicholas Matuzita Mizoguchi on 9/13/15.
//
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface MSCircleProgressBar : UIView

@property (nonatomic,strong) IBInspectable UIColor *circleBackgroundColor;
@property (nonatomic,strong) IBInspectable UIColor *circleColor;
@property (nonatomic,assign) IBInspectable CGFloat animationTime;
@property (nonatomic,assign) IBInspectable CGFloat circleStroke;
@property (nonatomic,assign) IBInspectable CGFloat progress;

@end
