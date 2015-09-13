//
//  MSCircleProgressBar.m
//  Pods
//
//  Created by Nicholas Matuzita Mizoguchi on 9/13/15.
//
//

#import "MSCircleProgressBar.h"

@interface MSCircleProgressBar()
@property (nonatomic,assign) CGFloat previousProgress;
@property (nonatomic,assign) CGFloat radius;
@end

@implementation MSCircleProgressBar

-(void)drawRect:(CGRect)rect
{
    _previousProgress = 0;

    // Set up the shape of the circle
    _circleStroke -= 0.2f;
    _radius = rect.size.width > rect.size.height ? rect.size.width/2 : rect.size.height/2;
    _radius -= _circleStroke/2;
    
    [self createCircleWithStartAngle:0 endAngle:360 color:_circleBackgroundColor rect:rect animated:NO];

    // Set up the shape of the circle
    _circleStroke += 0.2f;
    _radius = rect.size.width > rect.size.height ? rect.size.width/2 : rect.size.height/2;
    _radius -= _circleStroke/2;
    
    [self createCircleWithStartAngle:_previousProgress*3.6
                            endAngle:_progress*3.6
                               color:_circleColor
                                rect:self.frame animated:YES];
}

-(void)createCircleWithStartAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle color:(UIColor*)color rect:(CGRect)rect animated:(BOOL)animated
{
    startAngle = startAngle*M_PI/180-M_PI_2;
    endAngle = endAngle*M_PI/180-M_PI_2;
    
    CAShapeLayer *circle = [CAShapeLayer layer];
    // Make a circular shape
    
    UIBezierPath *path=[UIBezierPath bezierPathWithArcCenter:CGPointMake(_radius, _radius) radius:_radius startAngle:startAngle endAngle:endAngle clockwise:YES];
    
    circle.path = [path CGPath];
    
    
    // Center the shape in self.view
    circle.position = CGPointMake(CGRectGetMidX(self.bounds)-_radius,
                                  CGRectGetMidY(self.bounds)-_radius);
    
    
    circle.fillColor = [UIColor clearColor].CGColor;
    
    //making line end cap round
    circle.lineCap=kCALineCapButt;
    
    UIColor *strokeColor = color;
    
    circle.strokeColor = strokeColor.CGColor;
    circle.lineWidth = _circleStroke;
    
    // Add to parent layer
    [self.layer addSublayer:circle];
    
    if(animated) {
        // Configure animation
        CABasicAnimation *drawAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        drawAnimation.duration            = _animationTime;
        drawAnimation.repeatCount         = 1.0;
        
        
        drawAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
        drawAnimation.toValue   = [NSNumber numberWithFloat:1.0f];
        
        drawAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
        
        // Add the animation to the circle
        [circle addAnimation:drawAnimation forKey:@"drawCircleAnimation"];
    }
}

// TODO: Make progress change only the portion that changes, not reload everything
-(void)setProgress:(CGFloat)progress
{
    _progress = progress;
    [self setNeedsDisplay];
}

@end
