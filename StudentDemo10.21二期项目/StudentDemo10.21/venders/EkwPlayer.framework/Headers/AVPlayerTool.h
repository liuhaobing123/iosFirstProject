//
//  AVPlayerTool.h
//  EkwPlayer
//
//  Created by chen on 2017/10/25.
//  Copyright © 2017年 chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AVPlayerTool : NSObject

+ (NSString *)gainMD5String:(NSString *)oriString;

//
+ (void)debugLog:(id)log;

//
+ (NSBundle *)resourceBundle;

//
+ (void)postPlayerNoticeWithKey:(NSString *)key object:(id)object;

//
+ (void)CSetAudioSessionRecord:(BOOL)isRecord;

#pragma mark - 资源

/**
 获取资源时长
 
 @param sourcesURL sourcesURL 路径（本地/连接）
 @return 资源时长
 */
+ (float)getFileDurationSeconds:(NSString *)sourcesURL;

@end
