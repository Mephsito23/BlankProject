//
//  GetPictureClient.h
//  BlankProject
//
//  Created by mac on 2019/1/14.
//  Copyright © 2019年 Mephsito. All rights reserved.
//

#import "LCNetwork.h"

@interface GetPictureClient : LCBaseRequest<LCAPIRequest,YYModel>

///default: 1
@property (nonatomic, strong) NSNumber *page;
///default: 10
@property (nonatomic, strong) NSNumber *per_page;

@end
