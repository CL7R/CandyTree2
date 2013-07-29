//
//  PublicCheck.m
//  dbc
//
//  Created by CL7RNEC on 12-4-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "PublicCheck.h"

@implementation PublicCheck

+(BOOL)validateEmail: (NSString *) paramEmail {    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";    
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];    
    return [emailTest evaluateWithObject:paramEmail];
}
+(BOOL)validateEmpty: (NSString *) paramString{
    if (paramString.length==0) {
        return YES;
    }
    else{
        return NO;
    }
}
+(int)validateLength: (NSString *) paramString
         parmaLength: (int) parmaLength{
    if ([paramString length]==parmaLength) {
        return 1;
    }
    else if([paramString length]<parmaLength) {
        return 0;
    }
    else{
        return 2;
    }
}
+(BOOL)validateNumber: (NSString *) paramString{
    NSString *str = @"[0-9]+";    
    NSPredicate *strTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", str];    
    return [strTest evaluateWithObject:paramString];
}
+(NSString *)emptyTransform: (NSString *) paramString{
    if (paramString) {
        if (paramString.length==0) {
            return @"";
        }
        else{
            return paramString;
        }
    }
    else{
        return @"";
    }
}
+(BOOL)validatePhoneNumber: (NSString *) paramString{
    if (![PublicCheck validateEmpty:paramString]&&[PublicCheck validateNumber:paramString]&&[PublicCheck validateLength:paramString parmaLength:11]==1) {
        return YES;
    }
    else{
        return NO;
    }
}
+(BOOL)validateVarifiNumber: (NSString *) paramString
                parmaLength: (int) parmaLength{
    if (![PublicCheck validateEmpty:paramString]&&[PublicCheck validateNumber:paramString]&&[PublicCheck validateLength:paramString parmaLength:parmaLength]==1) {
        return YES;
    }
    else{
        return NO;
    }
}
+(BOOL)validatePassword: (NSString *) paramString{
    if (paramString.length>0) {
        return YES;
    }
    else{
        return NO;
    }
}
+(BOOL)validatePasswordSame: (NSString *) passwd
                   passwdRe: (NSString *) passwdRd{
    if ([passwd isEqualToString:passwdRd]) {
        return YES;
    }
    else{
        return NO;
    }
}
@end
