//
//  HPCoreTextViewController.m
//  HPLabraryProject
//
//  Created by 王辉平 on 17/4/18.
//  Copyright © 2017年 王辉平. All rights reserved.
//

#import "HPCoreTextViewController.h"
#include <MobileCoreServices/UTCoreTypes.h>

@interface HPCoreTextViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property(nonatomic,strong)UIImagePickerController *imagePickerController;
@property(nonatomic,strong)UITextView* textView;
@end

@implementation HPCoreTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.backBtn];
    
    UIButton* addImg = [[UIButton alloc]initWithFrame:CGRectMake(70, 10, 120, 30)];
    [addImg setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [addImg setTitle:@"addImg" forState:UIControlStateNormal];
    addImg.backgroundColor = [UIColor redColor];
    [addImg addTarget:self action:@selector(addImgAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addImg];
 
    UIButton* devBtn = [[UIButton alloc]initWithFrame:CGRectMake(200, 10, 120, 30)];
    [devBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [devBtn setTitle:@"生成Html" forState:UIControlStateNormal];
    devBtn.backgroundColor = [UIColor redColor];
    [devBtn addTarget:self action:@selector(devAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:devBtn];
    
    [self.view addSubview:self.textView];
    
}

- (void)devAction
{
    NSDictionary *exportParams = @{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType};
    NSData *htmlData = [self.textView.attributedText dataFromRange:NSMakeRange(0, self.textView.attributedText.length) documentAttributes:exportParams error:nil];
    NSString* htmlStr = [[NSString alloc] initWithData:htmlData encoding:NSUTF8StringEncoding];
    NSLog(@"html:%@",htmlStr);
}

- (void)addImgAction
{
    [self presentViewController:self.imagePickerController animated:YES completion:nil];
}

//适用获取所有媒体资源，只需判断资源类型
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    NSString *mediaType=[info objectForKey:UIImagePickerControllerMediaType];
    //判断资源类型
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]){
        //如果是图片
        UIImage* image = info[UIImagePickerControllerEditedImage];
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithAttributedString:self.textView.attributedText];
        NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
        attachment.image = image;
        NSMutableAttributedString *attachmentString = (NSMutableAttributedString *)[NSAttributedString attributedStringWithAttachment:attachment];
        [string insertAttributedString:attachmentString atIndex:self.textView.selectedRange.location];//index为用户指定要插入图片的位置
        self.textView.attributedText=string;
        
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UIImagePickerController*)imagePickerController
{
    if (_imagePickerController == nil) {
        _imagePickerController = [[UIImagePickerController alloc] init];
        _imagePickerController.delegate = self;
        _imagePickerController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        _imagePickerController.allowsEditing = YES;
        _imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    return _imagePickerController;
}
- (UITextView*)textView
{
    if (_textView == nil) {
        _textView = [[UITextView alloc]initWithFrame:CGRectMake(0, 80, self.view.bounds.size.width, 500)];
        _textView.backgroundColor = [UIColor greenColor];
    }
    return _textView;
}
@end
