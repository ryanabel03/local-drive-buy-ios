//
//  AMSlideOutGlobals.h
//  SlideOut
//
//  Created by Andrea on 14/08/12.
//  Copyright (c) 2012 Andrea Mazzini. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a
// copy of this software and associated documentation files (the "Software"),
// to deal in the Software without restriction, including
// without limitation the rights to use, copy, modify, merge, publish,
// distribute, sublicense, and/or sell copies of the Software, and to
// permit persons to whom the Software is furnished to do so, subject to
// the following conditions:
//
// The above copyright notice and this permission notice shall be included
// in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
// OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
// IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
// CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
// TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
// SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#define kSOViewTitle	@"title"
#define kSOController	@"controller"
#define kSOViewIcon		@"icon"
#define kSOViewTag		@"tag"
#define kSOViewBadge	@"badge"
#define kSOSection		@"section"
#define kSOBeforeBlock	@"before"
#define kSOAfterBlock	@"after"
#define kSOSectionTitle	@"title"
#define kSOItemIsAction	@"isAction"


FOUNDATION_EXPORT NSString *const AMOptionsEnableGesture;
FOUNDATION_EXPORT NSString *const AMOptionsEnableShadow;
FOUNDATION_EXPORT NSString *const AMOptionsSetButtonDone;
FOUNDATION_EXPORT NSString *const AMOptionsUseBorderedButton;
FOUNDATION_EXPORT NSString *const AMOptionsButtonIcon;
FOUNDATION_EXPORT NSString *const AMOptionsTableBackground;
FOUNDATION_EXPORT NSString *const AMOptionsUseDefaultTitles;

FOUNDATION_EXPORT NSString *const AMOptionsSlideValue;
FOUNDATION_EXPORT NSString *const AMOptionsBackground;
FOUNDATION_EXPORT NSString *const AMOptionsSelectionBackground;

FOUNDATION_EXPORT NSString *const AMOptionsHeaderFont;
FOUNDATION_EXPORT NSString *const AMOptionsHeaderFontColor;
FOUNDATION_EXPORT NSString *const AMOptionsHeaderShadowColor;
FOUNDATION_EXPORT NSString *const AMOptionsHeaderPadding;
FOUNDATION_EXPORT NSString *const AMOptionsHeaderGradientUp;
FOUNDATION_EXPORT NSString *const AMOptionsHeaderGradientDown;
FOUNDATION_EXPORT NSString *const AMOptionsHeaderSeparatorUpper;
FOUNDATION_EXPORT NSString *const AMOptionsHeaderSeparatorLower;

FOUNDATION_EXPORT NSString *const AMOptionsCellFont;
FOUNDATION_EXPORT NSString *const AMOptionsCellFontColor;
FOUNDATION_EXPORT NSString *const AMOptionsCellBadgeFont;
FOUNDATION_EXPORT NSString *const AMOptionsCellBackground;
FOUNDATION_EXPORT NSString *const AMOptionsCellSeparatorUpper;
FOUNDATION_EXPORT NSString *const AMOptionsCellSeparatorLower;
FOUNDATION_EXPORT NSString *const AMOptionsCellShadowColor;

FOUNDATION_EXPORT NSString *const AMOptionsImagePadding;
FOUNDATION_EXPORT NSString *const AMOptionsTextPadding;
FOUNDATION_EXPORT NSString *const AMOptionsBadgePosition;

// SlideOut Controller
#define kSlideValue				260
#define kBackground				[UIColor colorWithRed:0.19 green:0.22 blue:0.29 alpha:1.0]
#define kSelectionBackground	[UIColor colorWithRed:0.10 green:0.13 blue:0.20 alpha:1.0]

// Table Cell
#define kImagePadding		50
#define kTextPadding		20
#define kBadgePosition		220
#define kCellBackground		[UIColor colorWithRed:0.19 green:0.22 blue:0.29 alpha:1.0].CGColor
#define kUpperSeparator		[UIColor colorWithRed:0.24 green:0.27 blue:0.33 alpha:1.0].CGColor
#define kLowerSeparator		[UIColor colorWithRed:0.14 green:0.16 blue:0.21 alpha:1.0].CGColor
#define kCellFontColor		[UIColor colorWithRed:0.77 green:0.8 blue:0.85 alpha:1.0]
#define kCellShadowColor	[UIColor colorWithRed:0.21 green:0.15 blue:0.19 alpha:1.0]

// Header Cell
#define	kTextHeaderPadding	10
#define kGradientUp			[UIColor colorWithRed:0.26 green:0.29 blue:0.36 alpha:1]
#define kGradientDown		[UIColor colorWithRed:0.22 green:0.25 blue:0.32 alpha:1]
#define kUpperSeparator		[UIColor colorWithRed:0.24 green:0.27 blue:0.33 alpha:1.0].CGColor
#define kLowerSeparator		[UIColor colorWithRed:0.14 green:0.16 blue:0.21 alpha:1.0].CGColor
#define kFontColor			[UIColor colorWithRed:0.49 green:0.50 blue:0.57 alpha:1.0]
#define kFontShadowColor	[UIColor colorWithRed:0.21 green:0.15 blue:0.19 alpha:1.0]