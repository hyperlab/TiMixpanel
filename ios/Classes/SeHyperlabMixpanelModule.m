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

// Initialize Mixpanel
// args[0] String: Mixpanel API Token
- (void)initWithToken:(id)args
{
    NSString *token = [TiUtils stringValue:[args objectAtIndex:0]];
    NSLog(@"[DEBUG] Mixpanel initWithToken: %@", token);
    [Mixpanel sharedInstanceWithToken:token];
    
    //Turn this off so the survey doesn't pop up automatically. It crashes the app atm (Storyboards are not supported)
    [Mixpanel sharedInstance].showSurveyOnActive = NO;
    
    //Turn this off so the notification doesn't pop up automatically. It crashes the app atm (Storyboards are not supported)
    [Mixpanel sharedInstance].showNotificationOnActive = NO;
}

// Identify current user
// args[0] String: DistinctId
- (void)identify:(id)args
{
    NSString *value = [TiUtils stringValue:[args objectAtIndex:0]];
    NSLog(@"[DEBUG] Mixpanel indentify: %@", value);
    [[Mixpanel sharedInstance] identify:value];
}

// Create alias for generated DistinctId
// args[0] String: Alias
- (void)createAlias:(id)args
{
    NSString *alias = [TiUtils stringValue:[args objectAtIndex:0]];
    NSString *distinctId = [Mixpanel sharedInstance].distinctId;
    [self createAliasForId:[NSArray arrayWithObjects:alias, distinctId, nil]];
}

// Create alias for arbitrary DistinctId
// args[0] String: Alias
// args[1] String: DistinctId
- (void)createAliasForId:(id)args
{
    NSString *alias = [TiUtils stringValue:[args objectAtIndex:0]];
    NSString *distinctId = [TiUtils stringValue:[args objectAtIndex:1]];
    
    NSLog(@"[DEBUG] Mixpanel createAlias: %@ forDistinctId: %@", alias, distinctId);
    [[Mixpanel sharedInstance] createAlias:alias forDistinctID:distinctId];
}

// Getter for generated DistinctId
- (NSString *)distinctId
{
    return [NSString stringWithString:[Mixpanel sharedInstance].distinctId];
}

// Register super props once
// args[0] Dictionary: Properties
- (void)registerSuperProperties:(id)args
{
    ENSURE_DICT([args objectAtIndex:0]);
    NSDictionary *props = [args objectAtIndex:0];
    
    NSLog(@"[DEBUG] Mixpanel registerSuperProperties (%@)", [props description]);
    [[Mixpanel sharedInstance] registerSuperProperties:props];
}

// Register super props once
// args[0] Dictionary: Properties
- (void)registerSuperPropertiesOnce:(id)args
{
    ENSURE_DICT([args objectAtIndex:0]);
    NSDictionary *props = [args objectAtIndex:0];
    
    NSLog(@"[DEBUG] Mixpanel registerSuperPropertiesOnce (%@)", [props description]);
    [[Mixpanel sharedInstance] registerSuperPropertiesOnce:props];
}

// Track an event
// args[0] String: Event Name
// args[1] Dictionary: Optional properties to send along with event
- (void)track:(id)args
{
    NSString *event;
    NSDictionary *props;
    
    ENSURE_ARG_AT_INDEX(event, args, 0, NSString);
    ENSURE_ARG_OR_NIL_AT_INDEX(props, args, 1, NSDictionary);
    
    if (props==nil) {
        NSLog(@"[DEBUG] Mixpanel Track Event: %@", event);
        [[Mixpanel sharedInstance] track:event];
    } else {
        NSLog(@"[DEBUG] Mixpanel Track Event: %@ (%@)", event, [props description]);
        [[Mixpanel sharedInstance] track:event properties:props];
    }
}

// Set props in user profile
// args[0] Dictionary: Properties
- (void)profileSet:(id)args
{
    ENSURE_DICT([args objectAtIndex:0]);
    NSDictionary *props = [args objectAtIndex:0];

    NSLog(@"[DEBUG] Mixpanel People Set %@", [props description]);
    [[Mixpanel sharedInstance].people set:props];
}

// Set props in user profile once
// args[0] Dictionary: Properties
- (void)profileSetOnce:(id)args
{
    ENSURE_DICT([args objectAtIndex:0]);
    NSDictionary *props = [args objectAtIndex:0];

    NSLog(@"[DEBUG] Mixpanel People Set %@", [props description]);
    [[Mixpanel sharedInstance].people setOnce:props];
}

// Append props in user profile
// args[0] Dictionary: Properties
- (void)profileAppend:(id)args
{
    ENSURE_DICT([args objectAtIndex:0]);
    NSDictionary *props = [args objectAtIndex:0];

    NSLog(@"[DEBUG] Mixpanel People Append %@", [props description]);
    [[Mixpanel sharedInstance].people append:props];
}

// Increment props in user profile
// args[0] Dictionary: Properties
- (void)profileIncrement:(id)args
{
    ENSURE_DICT([args objectAtIndex:0]);
    NSDictionary *props = [args objectAtIndex:0];

    NSLog(@"[DEBUG] Mixpanel People Increment %@", [props description]);
    [[Mixpanel sharedInstance].people increment:props];
}

// Track charge
// args[0] Number: Charge
// args[1] Dictionary: Optional properties
- (void)profileTrackCharge:(id)args
{
    NSNumber *charge;
    NSDictionary *props;

    ENSURE_ARG_AT_INDEX(charge, args, 0, NSNumber);
    ENSURE_ARG_OR_NIL_AT_INDEX(props, args, 1, NSDictionary);

    if (props==nil) {
        NSLog(@"[DEBUG] Mixpanel People Track Charge: %@", charge);
        [[Mixpanel sharedInstance].people trackCharge:charge];
    } else {
        NSLog(@"[DEBUG] Mixpanel People Track Charge: %@ (%@)", charge, [props description]);
        [[Mixpanel sharedInstance].people trackCharge:charge withProperties:props];
    }
}

// Clear all charges
- (void)profileClearCharges:(id)args
{
    NSLog(@"[DEBUG] Mixpanel People Clear Charges");
    [[Mixpanel sharedInstance].people clearCharges];
}

// Delete User
- (void)profileDeleteUser
{
    NSLog(@"[DEBUG] Mixpanel People Delete User");
    [[Mixpanel sharedInstance].people deleteUser];
}

// add the device token to receive pushnotifications
// args[0] String: DeviceToken
- (void)addPushDeviceToken:(id)value
{
    ENSURE_SINGLE_ARG(value, NSString);
    
    NSData *data = [value dataUsingEncoding:NSUTF8StringEncoding];
    [[Mixpanel sharedInstance].people addPushDeviceToken:data];
}

// Uploads queued data to the Mixpanel server.
- (void)flush:(id)args
{
    [[Mixpanel sharedInstance] flush];
}

// get the flush interval
-(id)flushInterval
{
    return [Mixpanel sharedInstance].flushInterval;
}

// set the flush interval
// args[0] Number: Interval in seconds to flush events to MixPanel
-(void)setFlushInterval:(id)value
{
    ENSURE_SINGLE_ARG(value, NSNumber);
    
    [Mixpanel sharedInstance].flushInterval = [TiUtils intValue:value];
}

// Clears all stored properties and distinct IDs. Useful if your app's user logs out.
- (void)reset:(id)args
{
    [[Mixpanel sharedInstance] reset];
}

@end
