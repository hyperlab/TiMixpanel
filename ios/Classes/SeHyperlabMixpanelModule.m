/**
 * Copyright (C) 2014 Hyperlab AB
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "SeHyperlabMixpanelModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

#import "Mixpanel.h"

@implementation SeHyperlabMixpanelModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"534f4d59-d4ea-4f21-bdc0-e9d1858c9c8f";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"se.hyperlab.mixpanel";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
	
	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably
	
	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup 

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added 
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

#pragma Public APIs

-(void)initWithToken:(id)args
{
	ENSURE_SINGLE_ARG(args, NSString);
    [Mixpanel sharedInstanceWithToken:(NSString *)args];
}

-(void)identify:(id)args
{
    NSString *value = [TiUtils stringValue:[args objectAtIndex:0]];
    NSLog(@"[DEBUG] indentifyUser: %@", value);
    [[Mixpanel sharedInstance] identify:value];
}

-(void)nameTag:(id)args
{
    NSString *value = [TiUtils stringValue:[args objectAtIndex:0]];
    NSLog(@"[DEBUG] setNameTag: %@", value);
    [[Mixpanel sharedInstance] setNameTag:value];
}

//Register super props
//args[0]: Properties
-(void)registerSuperProperties:(id)args
{
    NSDictionary *props =  [args objectAtIndex:0];
    
    NSLog(@"[DEBUG] Setting Super props");
    
    if (props==nil)
    {
        NSLog(@"[ERROR] Mixpanel SuperProperties missing");
    }
    else
    {
        [[Mixpanel sharedInstance] registerSuperProperties:props];
    }
}

//Register super props once
//args[0]: Properties
-(void)registerSuperPropertiesOnce:(id)args
{
    NSDictionary *props =  [args objectAtIndex:0];
    
    NSLog(@"[DEBUG] Setting SuperPropertiesOnce");
    
    if (props==nil)
    {
        NSLog(@"[ERROR] Mixpanel Super Properties missing");
    }
    else
    {
        [[Mixpanel sharedInstance] registerSuperPropertiesOnce:props];
    }
}

//Track an event.
//args[0]: str event
//args[1]: (opt) dict of properties to send along with event
-(void)track:(id)args
{
    NSString *event = [TiUtils stringValue:[args objectAtIndex:0]];
	NSDictionary *props = nil;
    
    NSLog(@"[DEBUG] Tracking Event: %@", event);
    
	if ([args count] > 1)
	{
		props = [args objectAtIndex:1];
	}
    
	if (props==nil)
	{
        [[Mixpanel sharedInstance] track:event];
	}
	else
	{
        [[Mixpanel sharedInstance] track:event properties:props];
	}
}


@end
