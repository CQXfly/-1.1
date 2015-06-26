//
//  ViewController.m
//  瀑布流1.1
//
//  Created by 崇庆旭 on 15/6/24.
//  Copyright (c) 2015年 崇庆旭. All rights reserved.
//

#import "ViewController.h"
#import "QXWaterflowerview.h"
#import "QXwaterflowerviewCell.h"



@interface ViewController () <QXWaterflowerviewDelegate,QXWaterflowerviewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    QXWaterflowerview *waterviewflower = [[QXWaterflowerview alloc] init];
    waterviewflower.frame = self.view.bounds;
    waterviewflower.delegate = self;
    waterviewflower.dataSource = self;
    [self.view addSubview:waterviewflower];
    
    
    [waterviewflower reloadData];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma  mark -QXWaterflowerviewDataSource

- (NSUInteger) numberOfCellsInWaterflowerview:(QXWaterflowerview *)waterflowerview
{
    
    return 100;
}

- (NSUInteger) numberOfColumnsInWaterflowerview:(QXWaterflowerview *)waterflowerview
{
    return 1;
}

- (QXwaterflowerviewCell *) waterflowerview:(QXWaterflowerview *)waterflowerview cellAtIndex:(NSUInteger)index
{
    static NSString *ID = @"reusable";
    
    
    QXwaterflowerviewCell *cell = [waterflowerview dequeueReusableCellWithIdentifier:ID];
    if ( !cell) {
        cell = [[QXwaterflowerviewCell alloc] initWithIdentifier:ID];
//        cell.identifier = ID;
    }
//    NSLog(@"%zd %p", index, cell);
    cell.backgroundColor = [UIColor redColor];
    
    
    return cell;
}


#pragma mark - QXWaterflowerviewDelegate

- (CGFloat) waterflowerview:(QXWaterflowerview *)waterflowerview heightForRowInIndex:(NSInteger)index
{
   
    switch (index % 3) {
        case 0: return 75;
        case 1: return 105;
        case 2: return 95;
        default: return 120;
    }
}

- (CGFloat ) waterflowerview:(QXWaterflowerview *)waterflowerview maginForType:(QXWaterflowerviewMarginType)type
{
    switch (type) {
        case QXWaterflowerviewMarginTypeTop: return 20;
        case QXWaterflowerviewMarginTypeBottom: return 40;
        case QXWaterflowerviewMarginTypeLeft: return 15;
        case QXWaterflowerviewMarginTypeRight: return 25;
        case QXWaterflowerviewMarginTypeColumn: return 30;
        default:
            return 10;
    }
}


- (UIView *) headerViewInWatervierflower:(QXWaterflowerview *) waterflowerview
{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor greenColor];
    view.bounds = CGRectMake(0, 0, 350, 100);
    
    
    return view;
}


-(void) waterflowerview:(QXWaterflowerview *)waterflowerview didSelectAtInIndex:(NSInteger)index
{
    NSLog(@"%zd",index);
}

@end
