//
//  VideoModel.h
//  StudentDemo10.21
//
//  Created by Haobing Liu on 2019/10/29.
//  Copyright © 2019 Haobing Liu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface VideoModel : NSObject

//@property (nonatomic, copy) NSString *biz;          
////@property (nonatomic, strong) NSMutableArray <MediaModel *> *list;  //音频列表
//@property (nonatomic, copy) NSString *book_id;          //分数
//@property (nonatomic, copy) NSString *bt_id;     //作品上传时间
////@property (nonatomic, strong) EKWStudentModel *studentModel;
@property (nonatomic, copy) NSString *audio; //视频地址
@property (nonatomic, copy) NSString *video_audio;   //视频背景音乐
@property (nonatomic, copy) NSString *video_img;   //视频的在线占位图片
//@property (nonatomic, copy) NSString *mixVideoPath;   //合成后的视频的本地路径
//@property (nonatomic, copy) NSString *sid;       //用于数据库保存用的关键词

@end

NS_ASSUME_NONNULL_END
