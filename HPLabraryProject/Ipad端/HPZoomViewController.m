//
//  HPZoomViewController.m
//  HPLabraryProject
//
//  Created by 王辉平 on 15/12/25.
//  Copyright © 2015年 王辉平. All rights reserved.
//

#import "HPZoomViewController.h"
#import "HPZoomView.h"
@interface HPZoomViewController ()<UIScrollViewDelegate>
{
    NSArray* imgArr;//img url
    NSMutableArray* imageViewArray;
    UIScrollView* scrol;
}
-(void)createSubViews;
-(void)showPageWithpage:(NSInteger)currentPage;
@end

@implementation HPZoomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    imageViewArray=[[NSMutableArray alloc]init];
    // Do any additional setup after loading the view
    imgArr=@[@"http://pic9.nipic.com/20100812/3289547_144304019987_2.jpg",@"http://c.hiphotos.baidu.com/image/pic/item/5bafa40f4bfbfbed91fbb0837ef0f736aec31faf.jpg",@"http://h.hiphotos.baidu.com/image/pic/item/6609c93d70cf3bc798e14b10d700baa1cc112a6c.jpg",@"http://a.hiphotos.baidu.com/image/pic/item/fc1f4134970a304ea537a729d5c8a786c8175ccf.jpg",@"http://d.hiphotos.baidu.com/image/pic/item/9f510fb30f2442a76aacf976d543ad4bd0130246.jpg",@"http://d.hiphotos.baidu.com/image/pic/item/b21bb051f819861865a669784ced2e738ad4e66d.jpg"];
    for (int i=0; i<imgArr.count; i++) {
        [imageViewArray addObject:[NSNull null]];
    }
    [self createSubViews];
}
-(void)setCurrentPage:(NSInteger)currentPage{
    _currentPage=currentPage;
    scrol.contentOffset= CGPointMake(ScreenFrame.width*currentPage, 0);
    [self showPageWithpage:currentPage];
}
-(void)showPageWithpage:(NSInteger)currentPage{
    [self loadImageViewWithpageIndex:currentPage-1];
    [self loadImageViewWithpageIndex:currentPage];
    [self loadImageViewWithpageIndex:currentPage+1];
}
-(void)loadImageViewWithpageIndex:(NSInteger)page{
    if (page<0||page>=imageViewArray.count) {
        return;
    }
    id currentView= [imageViewArray objectAtIndex:page];
    if (![currentView isKindOfClass:[HPZoomView class]]) {
        HPZoomView* hpView=[[HPZoomView alloc]initWithFrame:CGRectMake(page*ScreenFrame.width, 0, ScreenFrame.width, ScreenFrame.height)];
        DLog(@"url===%@",imgArr[page]);
        hpView.photoUrl=imgArr[page];
        [scrol addSubview:hpView];
    }
}
-(void)createSubViews{
    
    scrol=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, ScreenFrame.width, ScreenFrame.height)];
    scrol.contentSize=CGSizeMake(ScreenFrame.width*imgArr.count, ScreenFrame.height);
    scrol.userInteractionEnabled=YES;
    scrol.pagingEnabled=YES;
    scrol.delegate=self;
    [self.view addSubview:scrol];
    [self setCurrentPage:0];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIScrollViewDelegate

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    int page = scrollView.contentOffset.x/ScreenFrame.width;//[0,+]
    [self showPageWithpage:page];
   
}

@end
