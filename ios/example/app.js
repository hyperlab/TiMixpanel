// Simple test UI
var win = Ti.UI.createWindow({
  backgroundColor:'white',
  top: 0,
  bottom: 0,
  layout: 'vertical'
});
var trackEventButton = Ti.UI.createButton({
  top: 20,
  title: 'Track event'
});
var notificationButton = Ti.UI.createButton({
    title: 'Show Notification'
});
var surveyButton = Ti.UI.createButton({
    title: 'Show Survey'
});
win.add(trackEventButton);
win.add(notificationButton);
win.add(surveyButton);
win.open();


// Mixpanel test/demo code, mirrors the iOS API fairly well
// See: https://mixpanel.com/help/reference/ios

var mixpanel = require('se.hyperlab.mixpanel');

// The second parameter is optional. showSurveyOnActive and showNotificationOnActive
// are true by default.
mixpanel.initWithToken('YOUR-TOKEN-GOES-HERE', {
  showSurveyOnActive: false,
  showNotificationOnActive: false
});

// Flush queued data every 45 seconds (Instead of the default of 60 seconds)
mixpanel.flushInterval = 45;

Ti.API.log('Mixpanel distinctId: ' + mixpanel.distinctId);

// The same as:
// mixpanel.createAliasForId('NEW-TEST-ID', mixpanel.distinctId);
mixpanel.createAlias('NEW-TEST-ID');

mixpanel.identify('NEW-TEST-ID');
Ti.API.log('Mixpanel distinctId: ' + mixpanel.distinctId);

mixpanel.registerSuperProperties({
  'Device Model': Ti.Platform.model,
  'Application ID': Ti.App.id
});

mixpanel.registerSuperPropertiesOnce({
  'Affiliate ID': '123abc'
});

mixpanel.track('App Opened');

// Manually flush data to MixPanel
mixpanel.flush();

trackEventButton.addEventListener('click', function () {
  mixpanel.track('Custom Event', {
    'Custom Prop': 'value'
  });
});
notificationButton.addEventListener('click', function () {
  mixpanel.showNotification();
});
surveyButton.addEventListener('click', function () {
  mixpanel.showSurvey();
});

// User Profiles
mixpanel.profileSet({
  '$name': 'Full Name',
  '$email': 'test@example.com',

  key: 'value',
  special: 'once',
  num: 2,
  list: ['a']
});
mixpanel.profileSetOnce({
  special: 'twice', // Wont update key
});


mixpanel.profileIncrement({
  num: 1 // To a total of 3
});
mixpanel.profileAppend({
  list: ['b', 'c']
});

mixpanel.profileTrackCharge(150);
mixpanel.profileTrackCharge(100, {
  campaign: '123abc'
});


