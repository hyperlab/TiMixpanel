var mixpanel = require('se.hyperlab.mixpanel');
mixpanel.initWithToken('YOUR-TOKEN-GOES-HERE');

mixpanel.registerSuperProperties({
	model: Ti.Platform.model,
  os: Ti.Platform.osname,
  name: Ti.Platform.name
});

mixpanel.identify('TEST');

mixpanel.track('App Opened');

// open a single window
var win = Ti.UI.createWindow({
	backgroundColor:'white'
});
var button = Ti.UI.createButton({
	title: 'Track event'
});
win.add(button);
win.open();

button.addEventListener('click', function () {
	mixpanel.track('Custom Event', { data: 'value' })
});
