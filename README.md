# AyLoading
this is a extension for iOS/macOS, which can add a loading state to UIButton(NSButton) UIView(NSView) UIBarButtonItem and its subclasses easily and quickly.

# Screenshot

### For iOS
![For iOS](https://github.com/Chakery/AyLoading/blob/master/ExampleForiOS/ayLoadingForiOS.gif)

### For macOS
![For macOS](https://github.com/Chakery/AyLoading/blob/master/ExampleForMacOS/ayLoadingFormacOS.gif)

# install

```
pod 'AyLoading'
```

# Using

```
// UIView or NSView
view.ay.startLoading()
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
