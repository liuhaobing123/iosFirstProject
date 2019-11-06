//
//  ACDModel.h
//  MJExtensionDemo
//
//  Created by 公安信息 on 17/2/9.
//  Copyright © 2017年 张艳晓. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@class EkModel,ChapModel;

@interface ACDModel : NSObject

//用户年级属性。
@property (nonatomic, copy) NSString *grade;
@property (nonatomic, copy) NSString *achievement_news;//我的成就新消息数，0表示无新消息，整型(暂时无效)
@property (nonatomic, copy) NSString *classmate_news;//同学动态新消息数，整型
@property (nonatomic, copy) NSString *oral_star_news;//口语之星新消息数，整型(暂时无效)

@property (nonatomic, copy) NSString *chapter_progress;
@property (nonatomic, copy) NSString *chapter_total;
@property (nonatomic, strong) EkModel * book_chosen;
@property (nonatomic, strong) NSArray <ChapModel *> *chapters;

@end

@interface EkModel : NSObject

@property (nonatomic, copy) NSString *biz;
@property (nonatomic, copy) NSString *book_id;
@property (nonatomic, copy) NSString *chapter_id;
@property (nonatomic, copy) NSString *book_name;
@property (nonatomic, copy) NSString *book_subname;
@property (nonatomic, copy) NSString *unit_id;
@property (nonatomic, copy) NSString *unit_title;
@property (nonatomic, copy) NSString *unit_topic;

@end

//篇章model 课堂同步 && 课外拓展
@interface ChapModel : NSObject

@property (nonatomic, copy) NSString *audio_url;// 课文音频url地址，string
@property (nonatomic, copy) NSString *biz;//业务号 string
@property (nonatomic, copy) NSString *chapter_id;// 课文唯一id，string
@property (nonatomic, copy) NSString *chapter_title;// 课文标题
@property (nonatomic, copy) NSString *chapter_url;// 获得该篇课文的url， string
@property (nonatomic, copy) NSString *path;//提交数据必要参数 string
@property (nonatomic, copy) NSString *read_count;// 该篇课文朗读的次数，整型，0表示未读
@property (nonatomic, copy) NSString *unit_id; //单元id
@property (nonatomic, copy) NSString *lesson_name; //课时名

@end

NS_ASSUME_NONNULL_END
