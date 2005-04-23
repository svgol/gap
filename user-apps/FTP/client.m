/*
 Project: FTP

 Copyright (C) 2005 Free Software Foundation

 Author: Riccardo Mottola

 Created: 2005-04-21

 Generic client class, to be subclassed.

 This library is free software; you can redistribute it and/or
 modify it under the terms of the GNU Lesser General Public
 License as published by the Free Software Foundation; either
 version 2.1 of the License, or (at your option) any later version.

 This library is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 Lesser General Public License for more details.

 You should have received a copy of the GNU Lesser General Public
 License along with this library; if not, write to the Free Software
 Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*/

#import "client.h"

@implementation client

- (NSString *)workingDir
{
    return [[NSString stringWithString:workingDir] retain];
}
- (void)setWorkingDirWithCString:(char *)dir
{
    [self setWorkingDir:[NSString stringWithCString:dir]];
}
- (void)setWorkingDir:(NSString *)dir
{
    self->workingDir = [NSString stringWithString:dir];
}

- (NSArray *)workDirSplit
{
    NSMutableArray *purgedList;
    NSArray        *list;
    NSEnumerator   *en;
    NSString       *currElement;
    
    purgedList = [NSMutableArray arrayWithCapacity:3];
    list = [workingDir componentsSeparatedByString:@"/"];
    en = [list reverseObjectEnumerator];
    while (currElement = [en nextObject])
        if ([currElement length])
            [purgedList addObject:currElement];
    [purgedList addObject:@"/"];
    return [purgedList retain];
}

- (NSArray *)dirContents
{
    NSLog(@"override me! getExtDirList superclass method");
    return nil;
}

@end
