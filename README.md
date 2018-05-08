# AyLoading
this is a extension for iOS/macOS, which can add a loading state to UIButton(NSButton) UIView(NSView) UIBarButtonItem and its subclasses easily and quickly.

# Screenshot

### For iOS
![For iOS](https://github.com/Chakery/AyLoading/blob/master/ExampleForiOS/ayLoadingForiOS.gif)

### For macOS
![For macOS](https://github.com/Chakery/AyLoading/blob/master/ExampleForMacOS/ayLoadingFormacOS.gif)

# Requirements

|version|OS|swift|
|---|---|---|
|v2.0.1|iOS8+, macOS10.10+|3.x|
|v3.0.0|iOS8+, macOS10.10+|4.x|

# Installation

```
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

target 'MyApp' do
  pod 'AyLoading', '3.0.0'
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
