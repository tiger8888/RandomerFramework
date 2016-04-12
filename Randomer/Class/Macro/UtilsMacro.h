//
//  UtilsMacro.h
//  Randomer
//
//  Created by 王子轩 on 16/4/8.
//  Copyright © 2016年 com.wzx. All rights reserved.
//

#ifndef UtilsMacro_h
#define UtilsMacro_h
typedef void(^Success)(id response);
typedef void(^Failure)();
typedef void(^Error)(NSError * error);
//RGB色值
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

#define KEY_USERNAME_PASSWORD @"Randomer_username_password"
#define KEY_USERNAME @"Randomer_username"
#define KEY_PASSWORD @"Randomer_password"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#define COLOR_BASE UIColorFromRGB(0X505975)
#define COLOR_LIGHT [UIColor colorWithRed:48/255.0 green:48/255.0 blue:48/255.0 alpha:1]

#define FilePATH(FileName,FileType) [[NSBundle mainBundle]pathForResource:FileName ofType:FileType]



#define CODE_SUCCESS @"201"

#define SHOW_ERROR(TITLE,MESSAGE) [RKDropdownAlert title:[Statics localizable:TITLE] message:[Statics localizable:MESSAGE] backgroundColor:[UIColor colorWithRed:1 green:79/255.0 blue:60/255.0 alpha:1] textColor:[UIColor whiteColor] time:3];
#endif /* UtilsMacro_h */
