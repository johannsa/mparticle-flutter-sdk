import UIKit
import Flutter
import mParticle_Apple_SDK

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    let options = MParticleOptions(key: "bca58cf345ebfd4caa45fed7b53daa62", secret: "koQiA5A8e1XvqZ0QIqcjnK4ELtb_3oYUu6uGb3RhiUdf0PxUsYpwX5yvL6DIINl9")
    options.logLevel = MPILogLevel.verbose
    MParticle.sharedInstance().start(with: options)

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
