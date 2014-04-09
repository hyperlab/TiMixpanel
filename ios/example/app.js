// Simple test UI
var win = Ti.UI.createWindow({
  backgroundColor:'white'
});
var button = Ti.UI.createButton({
  title: 'Track event'
});
win.add(button);
win.open();


// Mixpanel test/demo code, mirrors the iOS API fairly well
// See: https://mixpanel.com/help/reference/ios

var mixpanel = require('se.hyperlab.mixpanel');
mixpanel.initWithToken('YOUR-TOKEN-GOES-HERE');

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

button.addEventListener('click', function () {
  mixpanel.track('Custom Event', { 
    'Custom Prop': 'value' 
  });
});
