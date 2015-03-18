# Mixpanel Android Module

## Description

Mixpanel module for Titanium Mobile. This module currently only exposes a subset of the full Mixpanel API.

## Usage

Add the module to you project, the latest version of the module can be found inside the dist folder. See example/app.js for usage example.

## Surveys and In-App Notifications

Since version 0.6 both surveys and in-app notifications are supported, they are however not displayed automatically. For now you need to request them manually by running the following code after opening any window:

```js
// To show any new surveys
mixpanel.showSurveyIfAvailable();

// To show any new notifications
mixpanel.showNotificationIfAvailable();
```

To make testing of surveys and in-app notifications easier, you can enable verbose logging for the Mixpanel API and  "Test Mode" (shows surveys and notifications multiple times) by adding the following lines to the Android section of your `tiapp.xml`:

```xml
<android xmlns:android="http://schemas.android.com/apk/res/android">
	<manifest>
		<application>
			<meta-data android:name="com.mixpanel.android.MPConfig.TestMode" android:value="true" />
			<meta-data android:name="com.mixpanel.android.MPConfig.EnableDebugLogging" android:value="true" />
	   </application>
	</manifest>
</android>
```

More info on surveys and in-app notifications: https://mixpanel.com/help/reference/android#surveys

## Handling push notifications

@iamyellow's gcm.js module is a good place to integrate GCM into Titanium: https://github.com/iamyellow/gcm.js

To enable push handling in your app, read MixPanel's documentation to setup GCM correctly: https://mixpanel.com/help/reference/android#push_configure

After you have successfully integrated GCM into your app, you only have to give MixPanel your sender id:

````javascript
mixpanel.initWithToken('YOUR-TOKEN');
mixpanel.initPushHandling('YOUR-SENDER-ID');
```

## Changes

<<<<<<< HEAD
**0.9**
- Module compiled against Titanium SDK 3.5.1.GA to ensure that applications built with 3.5.1.GA do not crash on Lollipop.

**0.8**
- Added missing People Analytics `identify` call

**0.7**
- **Breaking change**: `identify` is no longer called automatically. If you want to use People Analytics with your own user ids, you have to call `identify` manually from now on.
- Added support for the following functions:
    - `profileTrackCharge(String name, Object properties)`
    - `profileClearCharges()`
    - `profileDeleteUser()`
    - `showSurveyById(id)`
    - `showNotificationById(id)`

**0.6**
- Upgraded Mixpanel SDK to 4.4.1
- Added support for Surveys and In-App Notifications via the following functions:
    - `showSurveyIfAvailable()`
    - `showNotificationIfAvailable()`

**0.5**
- Upgraded Mixpanel SDK to 4.4.0
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

## Building the module

In order to build this module you need `ant` and the proper SDK/NDK packages installed on your system. You need to copy `build.properties.example` to `build.properties` and create a `.classpath` file in this directory. A sample `.classpath` file is included below.

Make sure that you compile against 3.5.1.GA or above.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<classpath>
  <classpathentry kind="src" path="src"/>
  <classpathentry kind="src" path="build/.apt_generated"/>
  <classpathentry kind="con" path="org.eclipse.jdt.launching.JRE_CONTAINER/org.eclipse.jdt.internal.debug.ui.launcher.StandardVMType/J2SE-1.5"/>

  <classpathentry kind="lib" path="<ANDROID-SDK>/platforms/android-10/android.jar"/>
  <classpathentry kind="lib" path="<LIBRARY-PATH>/Titanium/mobilesdk/osx/3.5.1.GA/android/titanium.jar"/>
  <classpathentry kind="lib" path="<LIBRARY-PATH>/Titanium/mobilesdk/osx/3.5.1.GA/android/kroll-common.jar"/>
  <classpathentry kind="lib" path="<LIBRARY-PATH>/Titanium/mobilesdk/osx/3.5.1.GA/android/kroll-apt.jar"/>

  <classpathentry kind="lib" path="<ANDROID-SDK>/extras/google/google_play_services/libproject/google-play-services_lib/libs/google-play-services.jar"/>

  <classpathentry kind="lib" path="lib/mixpanel-android-4.4.1.jar"/>
  <classpathentry kind="output" path="bin"/>
</classpath>
```

## Contributors

**Jonatan Lundin**  
Web: http://hyperlab.se  
Twitter: @mr_lundis  

**Timan Rebel**  
Web: http://timanrebel.nl  
Twitter: @timanrebel  

**Torgny Bjers**  
Web: http://www.xorcode.com  
Twitter: @torgnybjers  

Initial code based on the [Titanium-Mixpanel-Module](https://github.com/meeech/Titanium-Mixpanel-Module) by @meeech.

## License

The MIT License (MIT)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
