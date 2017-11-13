//
//  ViewController.m
//  ScrollViewImageGallery
//
//  Created by Daniel Grosman on 2017-11-13.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import "ViewController.h"
#import "InitialViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic) UITapGestureRecognizer *tapGesture;
@property (nonatomic) UIImage *imageToPass;

@property (nonatomic) UIImageView *firstImage;
@property (nonatomic) UIImageView *secondImage;
@property (nonatomic) UIImageView *thirdImage;

@property (nonatomic) UIPageControl *pc;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView.delegate = self;
    
    self.firstImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse"]];
    self.firstImage.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.secondImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-in-Field"]];
    self.secondImage.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.thirdImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-night"]];
    self.thirdImage.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.scrollView addSubview:self.firstImage];
    [self.scrollView addSubview:self.secondImage];
    [self.scrollView addSubview:self.thirdImage];
    
    [self.firstImage.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active = YES;
    [self.secondImage.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active = YES;
    [self.thirdImage.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active = YES;
    
    [self.firstImage.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active = YES;
    [self.secondImage.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active = YES;
    [self.thirdImage.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active = YES;

    [self.firstImage.heightAnchor constraintEqualToAnchor:self.scrollView.heightAnchor].active = YES;
    [self.secondImage.heightAnchor constraintEqualToAnchor:self.scrollView.heightAnchor].active = YES;
    [self.thirdImage.heightAnchor constraintEqualToAnchor:self.scrollView.heightAnchor].active = YES;

    [self.firstImage.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor].active = YES;
    [self.firstImage.widthAnchor constraintEqualToAnchor:self.view.widthAnchor].active = YES;
    [self.firstImage.trailingAnchor constraintEqualToAnchor:self.secondImage.leadingAnchor].active = YES;

    [self.secondImage.widthAnchor constraintEqualToAnchor:self.view.widthAnchor].active = YES;
    [self.secondImage.trailingAnchor constraintEqualToAnchor:self.thirdImage.leadingAnchor].active = YES;

    [self.thirdImage.widthAnchor constraintEqualToAnchor:self.view.widthAnchor].active = YES;
    [self.thirdImage.trailingAnchor constraintEqualToAnchor:self.scrollView.trailingAnchor].active = YES;

    
    self.pc = [[UIPageControl alloc] init];
    [self.view addSubview:self.pc];
    self.pc.layer.zPosition = 100;
    self.pc.backgroundColor = [UIColor blackColor];
    self.pc.alpha = 0.5;
    self.pc.numberOfPages = 3;
    self.pc.translatesAutoresizingMaskIntoConstraints = NO;
    [self.pc.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active=YES;
    [self.pc.heightAnchor constraintEqualToConstant:24].active = YES;
    [self.pc.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    [self.pc.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    
    self.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHandler:)];
    [self.view addGestureRecognizer:self.tapGesture];
}


-(void)tapHandler:(UITapGestureRecognizer *)recognizer {
    CGPoint pointInView = [recognizer locationInView:self.scrollView];
    
    if (CGRectContainsPoint(self.firstImage.frame, pointInView)) {
        self.imageToPass = self.firstImage.image;
        [self performSegueWithIdentifier:@"detailSegue" sender:self.imageToPass];
    } else if (CGRectContainsPoint(self.secondImage.frame, pointInView)) {
        self.imageToPass = self.secondImage.image;
        [self performSegueWithIdentifier:@"detailSegue" sender:self.imageToPass];
    } else if (CGRectContainsPoint(self.thirdImage.frame, pointInView)) {
        self.imageToPass = self.thirdImage.image;
        [self performSegueWithIdentifier:@"detailSegue" sender:self.imageToPass];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    InitialViewController *destinationInitialViewController = [segue destinationViewController];
    destinationInitialViewController.selectedImage = self.imageToPass;
}

- (void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat pageWidth = self.scrollView.frame.size.width;
    float onePage = self.scrollView.contentOffset.x / pageWidth;
    NSInteger page = lround(onePage);
    self.pc.currentPage = page;
    
//    if (self.pc.currentPage < self.pc.numberOfPages) {
//        self.pc.currentPage ++;
//    } else {
//        self.pc.currentPage --;
//}
}
@end
