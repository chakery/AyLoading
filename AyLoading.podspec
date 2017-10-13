Pod::Spec.new do |s|
  s.name                    = "AyLoading"
  s.version                 = "2.0.1"
  s.summary                 = "loading..."
  s.homepage                = "https://github.com/Chakery/AyLoading"
  s.license                 = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author                  = { "Chakery" => "chakerychen@gmail.com" }
  s.ios.deployment_target   = "8.0"
  s.osx.deployment_target   = "10.10"
  s.source                  = { :git => "https://github.com/Chakery/AyLoading.git", :tag => "#{s.version}" }
  s.source_files            = "Classes", "Classes/**/*"
  s.osx.exclude_files       = ["Classes/UIView+Indicator.swift",
                                "Classes/UIButton+Loading.swift",
                                "Classes/UIBarButtonItem+Loading.swift",
                                "Classes/iOS+IndicatorView.swift",
                                "Classes/UIView+Animations.swift"]
  s.ios.exclude_files       = ["Classes/NSButton+Loading.swift",
                                "Classes/NSView+Indicator.swift",
                                "Classes/macOS+IndicatorView.swift",
                                "Classes/NSView+Animations.swift"]
end
