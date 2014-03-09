//
//  UIView+Utils.m
//

#import "UIView+Utils.h"

@implementation UIView (Utils)

- (void)changeOriginXTo:(CGFloat)originX {
    CGRect frame = self.frame;
    frame.origin.x = originX;
    self.frame = frame;
}

- (void)changeOriginYTo:(CGFloat)originY {
    CGRect frame = self.frame;
    frame.origin.y = originY;
    self.frame = frame;
}

@end
