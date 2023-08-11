//
//  RNCaulyAdView.m
//  RNCaulySample
//
//  Created by junhojohn on 2022/11/27.
//

#import <Foundation/Foundation.h>
#import "RNCaulyAdView.h"

@implementation RNCaulyAdView

- (instancetype)initWithFrame:(CGRect)frame{
  NSLog(@"[HelloCauly]RNCaulyAdView initWithFrame()start.");
  if((self = [super initWithFrame:frame])){
    NSLog(@"[HelloCauly]CaulyAdView init() start.");
    _caulyAdView = [[CaulyAdView alloc] initWithParentViewController:self];
    NSLog(@"[HelloCauly]CaulyAdView init() finish.");
    NSLog(@"[HelloCauly]CaulyAdView addSubView() start.");
    [self addSubview:_caulyAdView];
    NSLog(@"[HelloCauly]CaulyAdView addSubView() finish.");
  }
  NSLog(@"[HelloCauly]RNCaulyAdView initWithFrame()finish.");
  return self;
}

// 있어도 그만, 없어도 그만.
- (void)layoutSubviews{
  [super layoutSubviews];
  NSLog(@"[HelloCauly]RNCaulyAdView layoutSubviews()start.");
  _caulyAdView.frame = self.bounds;
  NSLog(@"[HelloCauly]RNCaulyAdView layoutSubviews()finish.");
}

// 있어도 그만, 없어도 그만.
- (void)didMoveToWindow{
  NSLog(@"[HelloCauly]RNCaulyAdView didMoveToWindow()start.");
  NSLog(@"[HelloCauly]RNCaulyAdView didMoveToWindow()finish.");
}

@end

