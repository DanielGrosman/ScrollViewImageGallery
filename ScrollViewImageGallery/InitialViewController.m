//
//  InitialViewController.m
//  ScrollViewImageGallery
//
//  Created by Daniel Grosman on 2017-11-13.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import "InitialViewController.h"

@interface InitialViewController () <UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *initialScrollView;
@property (strong, nonatomic) UIImageView *imageView;

@end

@implementation InitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.initialScrollView.delegate = self;
    
    self.imageView = [[UIImageView alloc] initWithImage:self.selectedImage];
    [self.initialScrollView addSubview:self.imageView];
    
    [self.imageView.topAnchor constraintEqualToAnchor:self.initialScrollView.topAnchor].active = YES;
    [self.imageView.leadingAnchor constraintEqualToAnchor:self.initialScrollView.leadingAnchor].active = YES;
    [self.imageView.trailingAnchor constraintEqualToAnchor:self.initialScrollView.trailingAnchor].active = YES;
    [self.imageView.bottomAnchor constraintEqualToAnchor:self.initialScrollView.bottomAnchor].active = YES;
    
    self.initialScrollView.minimumZoomScale = 0.5;
    self.initialScrollView.maximumZoomScale = 4;
}

- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

@end
