# Mixpanel iOS Module

## Description

Mixpanel module for Titanium Mobile. This module currently only exposes a subset of the full Mixpanel API.

## Usage

Add the module to you project, the latest version of the module can be found inside the dist folder. See example/app.js for usage example.

## Known Issues

* Not all the API is exposed at the moment

## Changes

**0.4**
- Disabled Surveys and In-App Notifications, because they currently crash the app. (It is unfortunately not possible to include Storyboards in native modules)

**0.3**
- Added support for the following functions:
    - `flush`: Uploads queued data to the Mixpanel server manually.
    - `setFlushInterval`: function to set the flush interval in seconds. (By default, queued data is flushed to the Mixpanel servers every minute).
    - `addPushDeviceToken`: Register the given device to receive push notifications. Make sure to call `identify` first!
    - `reset`: Clears all stored properties and distinct IDs. Useful if your app's user logs out.
- Upgraded MixPanel iOS SDK to version 2.3.6.

**0.2**
- Methods for managing user identity
- People/profile tracking
- Code cleanup

**0.1**
- Initial release

## Author

**Jonatan Lundin**  
Web: http://hyperlab.se  
Twitter: @mr_lundis  

Initial code based on the [Titanium-Mixpanel-Module](https://github.com/meeech/Titanium-Mixpanel-Module) by @meeech.

## License

The MIT License (MIT)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.