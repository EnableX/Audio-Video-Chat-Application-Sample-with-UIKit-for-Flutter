import UIKit
import Flutter
import AVFoundation
@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    if AVCaptureDevice.authorizationStatus(for: .video) ==  .authorized {
               //already authorized
           } else {
               AVCaptureDevice.requestAccess(for: .video, completionHandler: { (granted: Bool) in
                   if granted {
                       //access allowed
                   } else {
                       //access denied
                   }
               })
           }

        if AVCaptureDevice.authorizationStatus(for: .audio) ==  .authorized {
                  //already authorized
              } else {
                  AVCaptureDevice.requestAccess(for: .audio, completionHandler: { (granted: Bool) in
                      if granted {
                          //access allowed
                      } else {
                          //access denied
                      }
                })
        }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
