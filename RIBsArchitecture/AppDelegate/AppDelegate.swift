//
//  AppDelegate.swift
//  RIBsArchitecture
//
//  Created by RAFA on 2/28/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        return true
    }
}

protocol URLHandler: AnyObject {
  func handle(_ url: URL)
}
