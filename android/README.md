# Mixpanel Android Module

## Description

Mixpanel module for Titanium Mobile. This module currently only exposes a subset of the full Mixpanel API.

## Usage

Add the module to you project, the latest version of the module can be found inside the dist folder. See example/app.js for usage example.

## Known Issues

* Not all the API is exposed at the moment
* Flush interval can not be changed

## Handling push notifications

@iamyellow's gcm.js module is a good place to integrate GCM into Titanium: https://github.com/iamyellow/gcm.js

To enable push handling in your app, read MixPanel's documentation to setup GCM correctly: https://mixpanel.com/help/reference/android#push_configure

After you have successfully integrated GCM into your app, you only have to give MixPanel your sender id:

````javascript
mixpanel.initWithToken('YOUR-TOKEN');
mixpanel.initPushHandling('YOUR-SENDER-ID');
```



## Changes
**0.5**
- Upgraded Mixpnale SDK to 4.4.0
- Added support for the following functions:
    - `createAlias(String)`
    - `createAliasForId(String, String)`

**0.4**
- Fixed handling of push notifications

**0.3**
- Cleanup and added install referrer and survey activity to manifest file
- Updated documentation and example app.js
- Made properties for `track` optional

**0.2**
- Added support for the following functions:
    - `identify(String)`
    - `registerSuperProperties(Object)`
    - `registerSuperPropertiesOnce(Object)`
    - `track(String, Object)`
    - `profileSet(Object)`
    - `profileAppend(String, Object)`
    - `profileSetOnce(Object)`
    - `profileIncrement(Object)`
    - `addPushDeviceToken(String)`

**0.1**
- Initial release

## Contributors

**Jonatan Lundin**  
Web: http://hyperlab.se  
Twitter: @mr_lundis  

**Timan Rebel**  
Web: http://timanrebel.nl  
Twitter: @timanrebel  

Initial code based on the [Titanium-Mixpanel-Module](https://github.com/meeech/Titanium-Mixpanel-Module) by @meeech.

## License

The MIT License (MIT)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
