//
//  WebServices.m
//  scanQR
//
//  Created by Alexis Padilla on 3/5/15.
//  Copyright (c) 2015 Alexis Padilla. All rights reserved.
//

#import "WebServices.h"
#include <ifaddrs.h>
#include <arpa/inet.h>

//static NSString *URLaccess = @"http://192.168.0.7:8080/SiValeDemoServices/services";
static NSString *URLaccess = @"SiValeDemoServices/services";

@implementation WebServices


-(NSString*) sendQRCode:(NSString*)stringCode{
    @try{
        
        NSUserDefaults *usr = [NSUserDefaults standardUserDefaults];
        NSString *ip = [usr stringForKey:@"ip_preference"];
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@/%@/billParameters",ip,URLaccess]];
//        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/billParameters",URLaccess]];
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
        
        [request setHTTPMethod: @"POST"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        
        /*Original lines*/
//        NSData *requestData = [NSData dataWithBytes:[stringCode UTF8String] length:[stringCode length]];
        
        /*Test sending QRCode*/
        NSString *stringtest = [NSString stringWithFormat:@"{\"url\":\"%@\"}",stringCode];
        NSData *requestData = [NSData dataWithBytes:[stringtest UTF8String] length:[stringtest length]];
        
        
        [request setHTTPBody: requestData];
        // Creating the response and the error objects
        NSHTTPURLResponse* urlResponse = nil;
        NSError *error = [[NSError alloc] init];
        
        // Making the call to the REST service
        NSData *serviceData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
        NSLog(@"Error Description: %@",[error userInfo]);
        
        
        // Verifying if communicaction was successful
        if ([urlResponse statusCode] >= 200 && [urlResponse statusCode] < 300){
            
            
//            NSDictionary* dictionary = [NSJSONSerialization JSONObjectWithData:serviceData
//                                                                       options:kNilOptions
//                                                                         error:&errorS];

            NSString *response = [[NSString alloc] initWithData:serviceData encoding:NSUTF8StringEncoding];
            
            NSLog(@"response = %@", response);
            if (![response isEqual:[NSNull null]])
                return response;
            else
                return nil;
        } else
            return nil;
        
    }@catch (id theException) {
        NSLog(@"%@",theException);
        return @"Error";
    }
    return nil;
}

-(NSString*) sendFileURl:(NSURL*)fileurl name:(NSString*)filename{
    @try{
        
        NSData *filereceived = [[NSData alloc] initWithContentsOfURL:fileurl];
        
        
        NSUserDefaults *usr = [NSUserDefaults standardUserDefaults];
        NSString *ip = [usr stringForKey:@"ip_preferences"];
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@/%@/uploadFile",ip,URLaccess]];        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
        
        [request setHTTPMethod: @"POST"];
        
        NSString *boundary = @"---------------------------E19zNvXGzXaLvS5C";
//        NSString *contentType = [NSString stringWithFormat:@"boundary=%@", boundary];
        
//        [request setValue:contentType forHTTPHeaderField:@"Content-Type"];
        
        NSMutableData *body = [NSMutableData data];

        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"file\"; filename=\"%@\"\r\n", filename] dataUsingEncoding:NSUTF8StringEncoding]];
        
        [body appendData:[@"Content-Type: application/pdf\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[NSData dataWithData:filereceived]];
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
        [request setHTTPBody: body];
        NSString *postLength = [NSString stringWithFormat:@"%d",[body length]];
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        [request setValue:@"application/form-data" forHTTPHeaderField:@"Content-Type"];
//
        
        // Creating the response and the error objects
        NSHTTPURLResponse* urlResponse = nil;
        NSError *error = [[NSError alloc] init];
        
        // Making the call to the REST service
        NSData *serviceData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
        NSLog(@"Error Description: %@",[error userInfo]);
        NSString *response = [[NSString alloc] initWithData:serviceData encoding:NSUTF8StringEncoding];
        NSLog(@"Response: %@", response);
        
        // Verifying if communicaction was successful
        if ([urlResponse statusCode] >= 200 && [urlResponse statusCode] < 300){
            
            
            //            NSDictionary* dictionary = [NSJSONSerialization JSONObjectWithData:serviceData
            //                                                                       options:kNilOptions
            //                                                                         error:&errorS];
            
            response = [[NSString alloc] initWithData:serviceData encoding:NSUTF8StringEncoding];
            
            NSLog(@"response = %@", response);
            if (![response isEqual:[NSNull null]])
                return response;
            else
                return nil;
        } else
            return nil;
        
    }@catch (id theException) {
        NSLog(@"%@",theException);
    }
    return nil;
}

-(NSString*) reqTransactionsWithNo:(NSString*)cardNo {
    @try{
        
        NSUserDefaults *usr = [NSUserDefaults standardUserDefaults];
        NSString *ip = [usr stringForKey:@"ip_preference"];
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@/%@/transactions/%@",ip,URLaccess,cardNo]];
//        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/transactions/%@",URLaccess,cardNo]];
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
        [request setHTTPMethod: @"GET"];
        
        // Creating the response and the error objects
        NSHTTPURLResponse* urlResponse = nil;
        NSError *error = [[NSError alloc] init];
        
        // Making the call to the REST service
        NSData *serviceData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
        NSLog(@"Error Description: %@",[error userInfo]);
        NSString *response = [[NSString alloc] initWithData:serviceData encoding:NSUTF8StringEncoding];
        NSLog(@"Response: %@", response);
        
        // Verifying if communicaction was successful
        if ([urlResponse statusCode] >= 200 && [urlResponse statusCode] < 300){
            
            
            //            NSDictionary* dictionary = [NSJSONSerialization JSONObjectWithData:serviceData
            //                                                                       options:kNilOptions
            //                                                                         error:&errorS];
            
            response = [[NSString alloc] initWithData:serviceData encoding:NSUTF8StringEncoding];
            
            NSLog(@"response = %@", response);
            if (![response isEqual:[NSNull null]])
                return response;
            else
                return nil;
        } else
            return nil;
        
    }@catch (id theException) {
        NSLog(@"%@",theException);
    }
    return nil;
}

@end
