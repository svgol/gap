#include <AppKit/AppKit.h>
#include "AppController.h"
#include "StoneUI.h"
#include "GNUGoPlayer.h"

@implementation AppController

- (id) playerController
{
	return playerController;
}

- (void) applicationWillFinishLaunching: (NSNotification*)aNotification
{
	/* add human player */
	NSMutableDictionary *playerinfo;

	[playerController addPlayerClass:[Player class]];
	[playerController addPlayerClass:[GNUGoPlayer class]];

	/* TODO change these to messages */
	playerinfo = [NSMutableDictionary dictionary];
	[playerinfo setObject:@"Human Player"
				   forKey:@"Name"];
	[playerinfo setObject:[NSImage imageNamed:@"man_icon.png"]
				   forKey:@"Image"];
	[Player setInfo:playerinfo];

	playerinfo = [NSMutableDictionary dictionary];
	[playerinfo setObject:@"GNU Go"
				   forKey:@"Name"];
	[playerinfo setObject:[NSImage imageNamed:@"machine_icon.png"]
				   forKey:@"Image"];
	[GNUGoPlayer setInfo:playerinfo];

	[NSBundle loadNibNamed:@"Clock"
					 owner:self];

	[self _setupCopying];
	[self _setupAuthors];
}

- (void) _setupAuthors
{
}

- (void) _setupCopying
{
	/* initialize info */
	NSTextView *textView = [[[[[infoTab tabViewItemAtIndex:0] view] subviews] lastObject] documentView];


	[textView replaceCharactersInRange:NSMakeRange(0,0)
							withString:[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"COPYING" ofType:@"GPL"]]];
}

- (void) orderFrontInfoPanel: (id)sender
{
	[prefPanel center];
	[prefPanel orderFront: self];
}

- (void) orderFrontPlayerPanel: (id)sender
{
	[playerPanel center];
	[playerPanel orderFront: self];
}

- (void) orderFrontClockPanel: (id)sender
{
	[clockController orderFrontClockPanel:sender];
}

@end

