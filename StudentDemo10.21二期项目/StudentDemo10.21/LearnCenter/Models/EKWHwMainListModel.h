//
//  EKWHwMainListModel.h
//  StudentDemo10.21
//
//  Created by Haobing Liu on 2019/10/26.
//  Copyright © 2019 Haobing Liu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface EKWHwMainListModel : NSObject

//数据
@property (nonatomic, copy) NSString *archiveId;//": "101",//学期id
@property (nonatomic, copy) NSString *archiveName;//": "2016-2017第一学期",
@property (nonatomic, copy) NSString *book_name;//": "人教新目标 七年级上册"
@property (nonatomic, copy) NSString *end_time;//": "1460473200",//考生结束答题时间，或者收作业时间
@property (nonatomic, copy) NSString *finish_num;//": "0",//完成个数
@property (nonatomic, assign) BOOL is_new;
@property (nonatomic, copy) NSString *leave_msg;//": "请认真完成退回的作业",//退回原因
@property (nonatomic, copy) NSString *left_time;//": "2天8时3分"//交卷剩余时间（服务端给，本地计算会有问题）
@property (nonatomic, assign) NSUInteger mode_type;//": "0",//考试模式'考试模式: 1,日常2,仿真测试',11，机房考试
@property (nonatomic, copy) NSString *record_id;//": "101",
@property (nonatomic, assign) NSUInteger self_status;//": "0",//考试主体状态0-新发布1-已结束2-已取消3-已收卷
@property (nonatomic, copy) NSString *start_time;//": "1460348107",//考试开始时间
@property (nonatomic, copy) NSString *start_url;//": "htts://",//考试开始页面url
@property (nonatomic, assign) NSUInteger status;//": "0",//状态：0-未完成 1-结束 2-取消 3-退回
@property (nonatomic, copy) NSString *sys_time;//": "0",//系统时间
@property (nonatomic, copy) NSString *title;//": "拓展训练20171025",//名字
@property (nonatomic, copy) NSString *total_num;//": "10",//总的个数
@property (nonatomic, copy) NSString *type;//": "hw",//作业 训练 考试
@property (nonatomic, copy) NSString *undo;//": true,//学生是否未答题是：true否：false
@property (nonatomic, copy) NSString *url;//": "https://mapi.ekwing.com/student/exam/loadexamtest? ,//考试页面url

@end

NS_ASSUME_NONNULL_END
