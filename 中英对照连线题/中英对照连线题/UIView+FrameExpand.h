//
//  UIView+frameExpand.h
//  HiFun
//
//  Created by attackt on 16/7/28.
//  Copyright © 2016年 attackt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FrameExpand)<UIGestureRecognizerDelegate>

/**
 * Shortcut for frame.origin.x.
 *
 * Sets frame.origin.x = left
 */
@property (nonatomic) CGFloat left;

/**
 * Shortcut for frame.origin.y
 *
 * Sets frame.origin.y = top
 */
@property (nonatomic) CGFloat top;

/**
 * Shortcut for frame.origin.x + frame.size.width
 *
 * Sets frame.origin.x = right - frame.size.width
 */
@property (nonatomic) CGFloat right;

/**
 * Shortcut for frame.origin.y + frame.size.height
 *
 * Sets frame.origin.y = bottom - frame.size.height
 */
@property (nonatomic) CGFloat bottom;

/**
 * Shortcut for frame.size.width
 *
 * Sets frame.size.width = width
 */
@property (nonatomic) CGFloat width;

/**
 * Shortcut for frame.size.height
 *
 * Sets frame.size.height = height
 */
@property (nonatomic) CGFloat height;

/**
 * Shortcut for center.x
 *
 * Sets center.x = centerX
 */
@property (nonatomic) CGFloat centerX;

/**
 * Shortcut for center.y
 *
 * Sets center.y = centerY
 */
@property (nonatomic) CGFloat centerY;

/**
 * Return the x coordinate on the screen.
 */
@property (nonatomic, readonly) CGFloat screenX;

/**
 * Return the y coordinate on the screen.
 */
@property (nonatomic, readonly) CGFloat screenY;

/**
 * Return the x coordinate on the screen, taking into account scroll views.
 */
@property (nonatomic, readonly) CGFloat screenViewX;

/**
 * Return the y coordinate on the screen, taking into account scroll views.
 */
@property (nonatomic, readonly) CGFloat screenViewY;

/**
 * Return the view frame on the screen, taking into account scroll views.
 */
@property (nonatomic, readonly) CGRect screenFrame;

/**
 * Shortcut for frame.origin
 */
@property (nonatomic) CGPoint origin;

/**
 * Shortcut for frame.size
 */
@property (nonatomic) CGSize size;

/**
 * Return the width in portrait or the height in landscape.
 */
@property (nonatomic, readonly) CGFloat orientationWidth;

/**
 * Return the height in portrait or the width in landscape.
 */
@property (nonatomic, readonly) CGFloat orientationHeight;

/**
 *  Take a screenshot of current window
 *
 *  @return Return the screenshot as an UIImage
 */
- (UIImage *)takeScreenshot;


/**
 * Finds the first descendant view (including this view) that is a member of a particular class.
 */
- (UIView*)descendantOrSelfWithClass:(Class)cls;

/**
 * Finds the first ancestor view (including this view) that is a member of a particular class.
 */
- (UIView*)ancestorOrSelfWithClass:(Class)cls;



/**
 Attaches the given block for a single tap action to the receiver.
 @param block The block to execute.
 */
- (void)setTapActionWithBlock:(void (^)(void))block;

/**
 Attaches the given block for a long press action to the receiver.
 @param block The block to execute.
 */
- (void)setLongPressActionWithBlock:(void (^)(void))block;

/**
 return NSStringFromCGRect(self.frame);
 */
- (NSString *)frameStr;





/**
 *  Create a border around the UIView
 *
 *  @param color  Border's color
 *  @param radius Border's radius
 *  @param width  Border's width
 */
- (void)createBordersWithColor:(UIColor *)color
              withCornerRadius:(CGFloat)radius
                      andWidth:(CGFloat)width;

/**
 *  Remove the borders around the UIView
 */
- (void)removeBorders;

/**
 *  Create a shadow on the UIView
 *
 *  @param offset  Shadow's offset
 *  @param opacity Shadow's opacity
 *  @param radius  Shadow's radius
 */
- (void)createRectShadowWithOffset:(CGSize)offset
                           opacity:(CGFloat)opacity
                            radius:(CGFloat)radius;

/**
 *  Create a corner radius shadow on the UIView
 *
 *  @param cornerRadius Corner radius value
 *  @param offset       Shadow's offset
 *  @param opacity      Shadow's opacity
 *  @param radius       Shadow's radius
 */
- (void)createCornerRadiusShadowWithCornerRadius:(CGFloat)cornerRadius
                                          offset:(CGSize)offset
                                         opacity:(CGFloat)opacity
                                          radius:(CGFloat)radius;

/**
 *  Remove the shadow around the UIView
 */
- (void)removeShadow;

/**
 *  Set the corner radius of UIView
 *
 *  @param radius Radius value
 */
- (void)setCornerRadius:(CGFloat)radius;

/**
 *  Create a shake effect on the UIView
 */
- (void)shakeView;

/**
 *  Create a pulse effect on th UIView
 *
 *  @param seconds Seconds of animation
 */
- (void)pulseViewWithTime:(CGFloat)seconds;

/**
 *  Return super view whole
 *
 *  @return Return super view whole
 */
- (NSArray *)allSuperviews;

/**
 *  Remove subviews
 */
- (void)removeAllSubviews;

/**
 *  Return allsubviews
 *
 *  @return Return array with subviews
 */
- (NSArray *)allSubviews;

/**
 *  Return belong viewcontroller
 *
 *  @return Return UIViewController instance
 */
- (UIViewController *)belongViewController;

/**
 *  Bring it to front level
 */
- (void)bringToFront;

/**
 *  Send it to back level
 */
- (void)sendToBack;

/**
 *  upgrade it one level
 */
- (void)bringOneLevelUp;

/**
 *  downgrade it one level
 */
- (void)sendOneLevelDown;

/**
 *  whe single tapped
 *
 *  @param block block
 */
- (void)whenTapped:(void (^)())block;

/**
 *  whe double tapped
 *
 *  @param block block
 */
- (void)whenDoubleTapped:(void (^)())block;

/**
 *  whe tow finder tapped
 *
 *  @param block block
 */
- (void)whenTwoFingerTapped:(void (^)())block;

/**
 *  whe touched down
 *
 *  @param block block
 */
- (void)whenTouchedDown:(void (^)())block;

/**
 *  whe touched up
 *
 *  @param block block
 */
- (void)whenTouchedUp:(void (^)())block;

/**
 ** lineView:	   需要绘制成虚线的view
 ** lineLength:	 虚线的宽度
 ** lineSpacing:	虚线的间距
 ** lineColor:	  虚线的颜色
 **/
+ (instancetype)dashLineWithFrame:(CGRect)rect lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor;
@end
