//
//  WebServices.h
//  scanQR
//
//  Created by Alexis Padilla on 3/5/15.
//  Copyright (c) 2015 Alexis Padilla. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebServices : NSObject

-(NSString*) logingWithCard:(NSString*)cardNo andPass:(NSString*)pass;
-(NSString*) sendQRCode:(NSString*)stringCode;
-(NSString*) sendFileURl:(NSURL*)fileurl name:(NSString*)filename;
-(NSString*) reqTransactionsWithNo:(NSString*)cardNo;

@end
