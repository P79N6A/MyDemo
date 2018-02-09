//
//  StyleKitName.m
//  paintCodeTutorial
//
//  Created by guibin on 15/12/30.
//  Copyright (c) 2015 J1. All rights reserved.
//
//  Generated by PaintCode (www.paintcodeapp.com)
//

#import "StyleKitName.h"


@implementation StyleKitName

#pragma mark Cache

static UIColor* _color = nil;

static UIImage* _imageOfCanvas1 = nil;

#pragma mark Initialization

+ (void)initialize
{
    // Colors Initialization
    _color = [UIColor colorWithRed: 0.067 green: 0.553 blue: 0.855 alpha: 1];

}

#pragma mark Colors

+ (UIColor*)color { return _color; }

#pragma mark Drawing Methods

+ (void)drawCanvas1
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();

    //// Text Drawing
    CGRect textRect = CGRectMake(-7, -19, 108, 21);
    {
        NSString* textContent = @"Hello, World!";
        NSMutableParagraphStyle* textStyle = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
        textStyle.alignment = NSTextAlignmentLeft;

        NSDictionary* textFontAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize: UIFont.labelFontSize], NSForegroundColorAttributeName: UIColor.blackColor, NSParagraphStyleAttributeName: textStyle};

        CGFloat textTextHeight = [textContent boundingRectWithSize: CGSizeMake(textRect.size.width, INFINITY)  options: NSStringDrawingUsesLineFragmentOrigin attributes: textFontAttributes context: nil].size.height;
        CGContextSaveGState(context);
        CGContextClipToRect(context, textRect);
        [textContent drawInRect: CGRectMake(CGRectGetMinX(textRect), CGRectGetMinY(textRect) + (CGRectGetHeight(textRect) - textTextHeight) / 2, CGRectGetWidth(textRect), textTextHeight) withAttributes: textFontAttributes];
        CGContextRestoreGState(context);
    }


    //// Oval Drawing
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(15, 30, 220, 220)];
    [StyleKitName.color setFill];
    [ovalPath fill];


    //// Rectangle Drawing
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(114, 2, 22, 34)];
    [StyleKitName.color setFill];
    [rectanglePath fill];


    //// PaintCodeTutorial Drawing
    UIBezierPath* paintCodeTutorialPath = UIBezierPath.bezierPath;
    [paintCodeTutorialPath moveToPoint: CGPointMake(214.14, 30)];
    [paintCodeTutorialPath addLineToPoint: CGPointMake(235.36, 51.21)];
    [paintCodeTutorialPath addLineToPoint: CGPointMake(221.21, 65.35)];
    [paintCodeTutorialPath addCurveToPoint: CGPointMake(215.86, 60) controlPoint1: CGPointMake(221.21, 65.35) controlPoint2: CGPointMake(218.93, 63.07)];
    [paintCodeTutorialPath addLineToPoint: CGPointMake(206.14, 60)];
    [paintCodeTutorialPath addCurveToPoint: CGPointMake(206.14, 50.28) controlPoint1: CGPointMake(206.14, 60) controlPoint2: CGPointMake(206.14, 51.91)];
    [paintCodeTutorialPath addCurveToPoint: CGPointMake(200, 44.14) controlPoint1: CGPointMake(202.68, 46.82) controlPoint2: CGPointMake(200, 44.14)];
    [paintCodeTutorialPath addLineToPoint: CGPointMake(214.14, 30)];
    [paintCodeTutorialPath closePath];
    [StyleKitName.color setFill];
    [paintCodeTutorialPath fill];


    //// Bezier Drawing
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, 125, 140);

    UIBezierPath* bezierPath = UIBezierPath.bezierPath;
    [bezierPath moveToPoint: CGPointMake(4, -88)];
    [bezierPath addCurveToPoint: CGPointMake(4, -14.46) controlPoint1: CGPointMake(4, -88) controlPoint2: CGPointMake(4, -47.41)];
    [bezierPath addCurveToPoint: CGPointMake(15, 0) controlPoint1: CGPointMake(10.34, -12.71) controlPoint2: CGPointMake(15, -6.9)];
    [bezierPath addCurveToPoint: CGPointMake(4, 14.46) controlPoint1: CGPointMake(15, 6.9) controlPoint2: CGPointMake(10.34, 12.71)];
    [bezierPath addCurveToPoint: CGPointMake(4, 27) controlPoint1: CGPointMake(4, 22.16) controlPoint2: CGPointMake(4, 27)];
    [bezierPath addLineToPoint: CGPointMake(-4, 27)];
    [bezierPath addCurveToPoint: CGPointMake(-4, 14.46) controlPoint1: CGPointMake(-4, 27) controlPoint2: CGPointMake(-4, 22.16)];
    [bezierPath addCurveToPoint: CGPointMake(-15, 0) controlPoint1: CGPointMake(-10.34, 12.71) controlPoint2: CGPointMake(-15, 6.9)];
    [bezierPath addCurveToPoint: CGPointMake(-4, -14.46) controlPoint1: CGPointMake(-15, -6.9) controlPoint2: CGPointMake(-10.34, -12.71)];
    [bezierPath addCurveToPoint: CGPointMake(-4, -88) controlPoint1: CGPointMake(-4, -47.41) controlPoint2: CGPointMake(-4, -88)];
    [bezierPath addLineToPoint: CGPointMake(4, -88)];
    [bezierPath addLineToPoint: CGPointMake(4, -88)];
    [bezierPath closePath];
    [UIColor.whiteColor setFill];
    [bezierPath fill];

    CGContextRestoreGState(context);
}

+ (void)drawCanvas2
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();

    //// Bezier Drawing
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, 125, 110);

    UIBezierPath* bezierPath = UIBezierPath.bezierPath;
    [bezierPath moveToPoint: CGPointMake(4, -88)];
    [bezierPath addCurveToPoint: CGPointMake(4, -14.46) controlPoint1: CGPointMake(4, -88) controlPoint2: CGPointMake(4, -47.41)];
    [bezierPath addCurveToPoint: CGPointMake(15, 0) controlPoint1: CGPointMake(10.34, -12.71) controlPoint2: CGPointMake(15, -6.9)];
    [bezierPath addCurveToPoint: CGPointMake(4, 14.46) controlPoint1: CGPointMake(15, 6.9) controlPoint2: CGPointMake(10.34, 12.71)];
    [bezierPath addCurveToPoint: CGPointMake(4, 27) controlPoint1: CGPointMake(4, 22.16) controlPoint2: CGPointMake(4, 27)];
    [bezierPath addLineToPoint: CGPointMake(-4, 27)];
    [bezierPath addCurveToPoint: CGPointMake(-4, 14.46) controlPoint1: CGPointMake(-4, 27) controlPoint2: CGPointMake(-4, 22.16)];
    [bezierPath addCurveToPoint: CGPointMake(-15, 0) controlPoint1: CGPointMake(-10.34, 12.71) controlPoint2: CGPointMake(-15, 6.9)];
    [bezierPath addCurveToPoint: CGPointMake(-4, -14.46) controlPoint1: CGPointMake(-15, -6.9) controlPoint2: CGPointMake(-10.34, -12.71)];
    [bezierPath addCurveToPoint: CGPointMake(-4, -88) controlPoint1: CGPointMake(-4, -47.41) controlPoint2: CGPointMake(-4, -88)];
    [bezierPath addLineToPoint: CGPointMake(4, -88)];
    [bezierPath addLineToPoint: CGPointMake(4, -88)];
    [bezierPath closePath];
    [UIColor.whiteColor setFill];
    [bezierPath fill];

    CGContextRestoreGState(context);
}

#pragma mark Generated Images

+ (UIImage*)imageOfCanvas1
{
    if (_imageOfCanvas1)
        return _imageOfCanvas1;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(250, 250), NO, 0.0f);
    [StyleKitName drawCanvas1];

    _imageOfCanvas1 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfCanvas1;
}

#pragma mark Customization Infrastructure

- (void)setCanvas1Targets: (NSArray*)canvas1Targets
{
    _canvas1Targets = canvas1Targets;

    for (id target in self.canvas1Targets)
        [target setImage: StyleKitName.imageOfCanvas1.CIImage];
}


@end
