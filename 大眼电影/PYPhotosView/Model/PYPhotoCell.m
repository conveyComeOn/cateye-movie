//
//  PYPhotoCell.m
//  youzhu
//
//  Created by 谢培艺 on 16/2/19.
//  Copyright © 2016年 iphone5solo. All rights reserved.
//

#import "PYPhotoCell.h"
#import "PYPhoto.h"
#import "PYPhotoView.h"
#import "PYPhotosView.h"
#import "PYConst.h"
#import "UIImageView+WebCache.h"
#import "DALabeledCircularProgressView.h"

@interface PYPhotoCell ()


@end

@implementation PYPhotoCell

// 初始化
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // 创建contentScrollView
        UIScrollView *contentScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, PYScreenW, PYScreenH)];
        // 水平不允许有弹簧效果
        contentScrollView.alwaysBounceHorizontal = NO;
        // 取消滑动指示器
        contentScrollView.showsVerticalScrollIndicator = NO;
        contentScrollView.showsHorizontalScrollIndicator = NO;
        self.contentScrollView = contentScrollView;
        [self.contentView addSubview:contentScrollView];
        // 创建图片
        PYPhotoView *imageView = [[PYPhotoView alloc] init];
        imageView.isBig = YES;
        [self.contentScrollView addSubview:imageView];
        self.photoView = imageView;
        // 添加捏合手势
        UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self.photoView action:@selector(imageDidPinch:)];
        [self addGestureRecognizer:pinch];
    }
    return self;
}

- (void)setPhotoView:(PYPhotoView *)photoView
{
    _photoView = photoView;
    
    // 绑定photoCell
    photoView.photoCell = self;
}

// 设置图片（图片来源自网络）
- (void)setPhoto:(NSString *)photo
{
    _photo = photo;
    // 设置图片状态
    self.photoView.photosView.photosState = PYPhotosViewStateDidCompose;
    NSURL *imageUrl = [NSURL URLWithString:photo];
    // 添加加载进度指示器
    __weak typeof(self) _weakSelf = self;
    [self.photoView sd_setImageWithURL:imageUrl placeholderImage:PYPlaceholderImage options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        CGFloat progress = 1.0 * receivedSize / expectedSize;
        [_weakSelf.photoView.progressView setProgress:progress animated:YES];
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        _weakSelf.photoView.progressView.hidden = YES;
    }];

    // 取出图片大小
    CGSize imageSize = self.photoView.image.size;
    // 放大图片
    self.photoView.width = self.width;
    self.photoView.height = self.width * imageSize.height / imageSize.width;
    self.photoView.center = CGPointMake(self.photoView.width * 0.5, self.photoView.height * 0.5);
    // 设置scrollView的大小
    self.contentScrollView.size = self.photoView.size;
    self.contentScrollView.center = CGPointMake(PYScreenW * 0.5, PYScreenH * 0.5);
}

// 设置图片（图片来源自本地相册）
- (void)setImage:(UIImage *)image
{
    _image = image;
    self.photoView.image = image;
    // 设置图片状态
    self.photoView.photosView.photosState = PYPhotosViewStateWillCompose;
    // 取出图片大小
    CGSize imageSize = self.photoView.image.size;
    // 放大图片
    self.photoView.width = self.width;
    self.photoView.height = self.width * imageSize.height / imageSize.width;
    self.photoView.center = CGPointMake(self.photoView.width * 0.5, self.photoView.height * 0.5);
    // 设置scrollView的大小
    self.contentScrollView.size = self.photoView.size;
    self.contentScrollView.center = CGPointMake(PYScreenW * 0.5, PYScreenH * 0.5);
}

static NSString * const reuseIdentifier = @"Cell";

// 快速创建collectionCell
+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath
{
    PYPhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.size = CGSizeMake(PYScreenW, PYScreenH);
    cell.collectionView = collectionView;
    
    return cell;
}

@end
