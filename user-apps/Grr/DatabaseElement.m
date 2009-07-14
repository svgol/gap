/*
   Grr RSS Reader
   
   Copyright (C) 2006, 2007 Guenther Noack <guenther@unix-ag.uni-kl.de>

   This application is free software; you can redistribute it and/or 
   modify it under the terms of the MIT license. See COPYING.

*/

#import <Foundation/Foundation.h>

#import "DatabaseElement.h"

NSString* const DatabaseElementFocusRequestNotification = @"DatabaseElementFocusRequestNotification";

id<DatabaseElement> DatabaseElementFromPlistDictionary( NSDictionary* plistDictionary )
{
  id classObject;
  NSString* className;
  id<DatabaseElement> elem;

    NSCParameterAssert([plistDictionary isKindOfClass: [NSDictionary class]]);
    
    className = [plistDictionary objectForKey: @"isa"];
    
    NSCAssert1(
        [className isKindOfClass: [NSString class]],
        @"the dictionary's isa value \"%@\" is not a string.",
        className
    );
    
    classObject = NSClassFromString(className);
    
    NSCAssert1(
        classObject != nil,
        @"the dictionary's isa value \"%@\" cannot be resolved to a class",
        className
    );
    
    elem = [classObject alloc];
    elem = [elem initWithDictionary: plistDictionary];
    
    return elem;
}
