# AyLoading
this is a extension for iOS/macOS, which can add a loading state to UIButton(NSButton) UIView(NSView) UIBarButtonItem and its subclasses easily and quickly.

# Screenshot

![iOS](https://github.com/Chakery/AyLoading/blob/master/example/screenshot/ios.gif)

![macOS](https://github.com/Chakery/AyLoading/blob/master/example/screenshot/macos.gif)

# Requirements

|version|OS|swift|
|---|---|---|
|2.0.1|iOS8+, macOS10.10+|3.x|
|3.0.0|iOS8+, macOS10.10+|4.0|
|4.0.1|iOS8+, macOS10.10+|4.2|

# Installation

```
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!
swift_version = '4.2'

target 'MyApp' do
  pod 'AyLoading', '4.0.1'
end
```

# Using

```
// UIView or NSView
view.ay.startLoading(message: "Loading...")
view.ay.stopLoading()

// UIButton or NSButton
btn.ay.startLoading()
btn.ay.stopLoading()

// UIBarButtonItem
navigationItem.leftBarButtonItem.ay.startLoading()
navigationItem.leftBarButtonItem.ay.stopLoading()
```

# License

AyLoading is released under the MIT license. See LICENSE for details.
