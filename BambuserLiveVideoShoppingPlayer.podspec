Pod::Spec.new do |s|
  s.name                 = "BambuserLiveVideoShoppingPlayer"
  s.version              = "0.9.1"
  s.author               = { "Bambuser AB" => "support@bambuser.com" }
  s.homepage             = "https://github.com/bambuser/bambuser-livevideoshoppingplayer-sdk-ios"
  s.summary              = "Live video shopping player SDK for iOS"
  s.license              = { :type => "Commercial", :text => "Copyright 2021 Bambuser AB" }
  s.platform             = :ios, "13.0"
  s.source               = { :git => "https://github.com/bambuser/bambuser-livevideoshoppingplayer-sdk-ios", :tag => s.version }
  s.vendored_frameworks  = "Sources/BambuserLiveVideoShoppingPlayer.xcframework"
end
