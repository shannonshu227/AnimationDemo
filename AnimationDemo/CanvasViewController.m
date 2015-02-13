//
//  CanvasViewController.m
//  AnimationDemo
//
//  Created by Xiangnan Xu on 2/12/15.
//  Copyright (c) 2015 Yahoo. All rights reserved.
//

#import "CanvasViewController.h"

@interface CanvasViewController ()
@property (weak, nonatomic) IBOutlet UIView *trayView;
@property (weak, nonatomic) IBOutlet UIImageView *arrowView;
@property (weak, nonatomic) IBOutlet UIImageView *smileyView1;
@property (weak, nonatomic) IBOutlet UIImageView *smileyView2;
@property (weak, nonatomic) IBOutlet UIImageView *smileyView3;
@property (weak, nonatomic) IBOutlet UIImageView *smileyView4;
@property (weak, nonatomic) IBOutlet UIImageView *smileyView5;
@property (weak, nonatomic) IBOutlet UIImageView *smileyView6;
@property (strong, nonatomic) UIImageView *newlyCreatedImageView;

- (void) onCustomPan:(UIPanGestureRecognizer *)panGestureRecognizer;
- (void) onSmileyPan:(UIPanGestureRecognizer *)panGestureRecognizer;
@end

@implementation CanvasViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    [self.arrowView setImage:[UIImage imageNamed:@"down_arrow.png"]];
    [self.smileyView1 setImage:[UIImage imageNamed:@"dead@2x.png"]];
    [self.smileyView2 setImage:[UIImage imageNamed:@"excited@2x.png"]];

    [self.smileyView3 setImage:[UIImage imageNamed:@"happy@2x.png"]];

    [self.smileyView4 setImage:[UIImage imageNamed:@"sad@2x.png"]];

    [self.smileyView5 setImage:[UIImage imageNamed:@"tongue@2x.png"]];
    [self.smileyView6 setImage:[UIImage imageNamed:@"wink@2x.png"]];


    
    
    // The onCustomPan: method will be defined in Step 3 below.
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onCustomPan:)];
    
    // Attach it to a view of your choice. If it's a UIImageView, remember to enable user interaction
    [self.trayView addGestureRecognizer:panGestureRecognizer];
    
    UIPanGestureRecognizer *panGestureRecognizerforSmiley1 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onSmileyPan:)];
    UIPanGestureRecognizer *panGestureRecognizerforSmiley2 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onSmileyPan:)];
    UIPanGestureRecognizer *panGestureRecognizerforSmiley3 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onSmileyPan:)];
    UIPanGestureRecognizer *panGestureRecognizerforSmiley4 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onSmileyPan:)];
    UIPanGestureRecognizer *panGestureRecognizerforSmiley5 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onSmileyPan:)];
    UIPanGestureRecognizer *panGestureRecognizerforSmiley6 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onSmileyPan:)];
    [self.smileyView1 addGestureRecognizer:panGestureRecognizerforSmiley1];
    [self.smileyView2 addGestureRecognizer:panGestureRecognizerforSmiley2];
    [self.smileyView3 addGestureRecognizer:panGestureRecognizerforSmiley3];
    [self.smileyView4 addGestureRecognizer:panGestureRecognizerforSmiley4];
    [self.smileyView5 addGestureRecognizer:panGestureRecognizerforSmiley5];
    [self.smileyView6 addGestureRecognizer:panGestureRecognizerforSmiley6];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) onCustomPan:(UIPanGestureRecognizer *)panGestureRecognizer {
    
    CGPoint point = [panGestureRecognizer locationInView:self.view];
    CGPoint velocity = [panGestureRecognizer velocityInView:self.view];
    
    if (panGestureRecognizer.state == UIGestureRecognizerStateBegan) {
        NSLog(@"Gesture began at: %@", NSStringFromCGPoint(point));
        
    } else if (panGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        NSLog(@"Gesture changed: %@", NSStringFromCGPoint(point));

            CGRect frame = self.trayView.frame;
            frame.origin.y = point.y;
            self.trayView.frame = frame;

    } else if (panGestureRecognizer.state == UIGestureRecognizerStateEnded) {
        NSLog(@"Gesture ended: %@", NSStringFromCGPoint(point));
        if (velocity.y > 0) {
            CGRect frame = self.trayView.frame;
            frame.origin.y = 568 - 40;
            self.trayView.frame = frame;
            
        } else {
            
            CGRect frame = self.trayView.frame;
            frame.origin.y = 568 - 241;
            self.trayView.frame = frame;
        }
        
    }
}


- (void) onSmileyPan:(UIPanGestureRecognizer *)panGestureRecognizer {
    CGPoint point = [panGestureRecognizer locationInView:self.view];
    CGPoint velocity = [panGestureRecognizer velocityInView:self.view];
    UIImageView *currentImageView = (UIImageView *)panGestureRecognizer.view;
    CGRect currentFrame = currentImageView.frame;
    
    
    

    if (panGestureRecognizer.state == UIGestureRecognizerStateBegan) {
        NSLog(@"Gesture began at: %@", NSStringFromCGPoint(point));
                UIImageView *newImageView = [[UIImageView alloc] initWithFrame:CGRectMake(currentFrame.origin.x, currentFrame.origin.y+568-241, currentFrame.size.width, currentFrame.size.height)];
        newImageView.userInteractionEnabled = YES;
        [newImageView setImage:currentImageView.image];
        [self.view addSubview:newImageView];
        self.newlyCreatedImageView = newImageView;
        
         UIPanGestureRecognizer *newPanRecog = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onNewlyCreatedSmileyPan:)];
        [self.newlyCreatedImageView addGestureRecognizer:newPanRecog];


    } else if (panGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        NSLog(@"Smiley Gesture changed: %@", NSStringFromCGPoint(point));
        CGRect frame = self.newlyCreatedImageView.frame;
        frame.origin.x = point.x;
        frame.origin.y = point.y;
        self.newlyCreatedImageView.frame = frame;
    } else if (panGestureRecognizer.state == UIGestureRecognizerStateEnded) {
        NSLog(@"Gesture ended: %@", NSStringFromCGPoint(point));
    }
}


- (void)onNewlyCreatedSmileyPan:(UIPanGestureRecognizer *)panGestureRecognizer {
    CGPoint point = [panGestureRecognizer locationInView:self.view];
    CGPoint velocity = [panGestureRecognizer velocityInView:self.view];
    
    if (panGestureRecognizer.state == UIGestureRecognizerStateBegan) {
        NSLog(@"Gesture began at: %@", NSStringFromCGPoint(point));
    } else if (panGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        NSLog(@"Newly created smiley Gesture changed: %@", NSStringFromCGPoint(point));
    } else if (panGestureRecognizer.state == UIGestureRecognizerStateEnded) {
        NSLog(@"Gesture ended: %@", NSStringFromCGPoint(point));
    }
    
}

@end
