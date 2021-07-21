//
//  BackViewController.m
//  popcornTIme
//
//  Created by Sad  on 9/6/14.
//  Copyright (c) 2014 Sad. All rights reserved.
//

#import "BackViewController.h"

@interface BackViewController ()

@end

@implementation BackViewController{
    UIImageView *img;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   img=[[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:img];
    [img setImage:[UIImage imageNamed:@"Default.png"]];
    
}

-(void)viewWillLayoutSubviews{
    UIInterfaceOrientation statusBarOrientation =[UIApplication sharedApplication].statusBarOrientation;
    if(UIInterfaceOrientationIsLandscape(statusBarOrientation))
    {
        
        [img setImage:[UIImage imageNamed:@"Landscape.png"]];
    }
    else
        [img setImage:[UIImage imageNamed:@"Default.png"]];

}
/*
-(void) will{
    UIInterfaceOrientation statusBarOrientation =[UIApplication sharedApplication].statusBarOrientation;
    if(UIInterfaceOrientationIsLandscape(statusBarOrientation))
       {
       
        [img setImage:[UIImage imageNamed:@"Landscape.png"]];
       }
       else
        [img setImage:[UIImage imageNamed:@"Default.png"]];
}
 
 */



-(NSUInteger)supportedInterfaceOrientations
{
   
    return UIInterfaceOrientationMaskPortrait;
}

-(BOOL) shouldAutorotate{
    return NO;
}


-(UIInterfaceOrientation) preferredInterfaceOrientationForPresentation{
    return UIInterfaceOrientationPortrait;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
