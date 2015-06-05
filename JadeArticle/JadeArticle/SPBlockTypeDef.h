//
//  SPBlockTypeDef.h
//  HKToilet
//
//  Created by Roselifeye on 14-5-6.
//  Copyright (c) 2014年 Roselifeye. All rights reserved.
//

#ifndef HKToilet_SPBlockTypeDef_h
#define HKToilet_SPBlockTypeDef_h

typedef void(^SPBlock)(void);
typedef void(^SPBOOLBlock)(BOOL result);
typedef void(^SPBlockBlock)(SPBlock block);
typedef void(^SPObjectBlock)(id obj);
typedef void(^SPArrayBlock)(NSArray *array);
typedef void(^SPMutableArrayBlock)(NSMutableArray *array);
typedef void(^SPDictionaryBlock)(NSDictionary *dic);
typedef void(^SPErrorBlock)(NSError *error);
typedef void(^SPIndexBlock)(NSInteger index);
typedef void(^SPFloatBlock)(CGFloat afloat);
typedef void(^SPStringBlock)(NSString *str);

typedef void(^SPBlockRequestEnd)(BOOL result, NSString *resultMessage, id object);

typedef void(^SPCancelBlock)(id viewController);
typedef void(^SPFinishedBlock)(id viewController, id object);

typedef void(^SRSendRequestAndResendRequestBlock)(id sendBlock, id resendBlock);

#endif
