//
//  AppComponent.swift
//  RIBsArchitecture
//
//  Created by RAFA on 4/6/25.
//

import Foundation

import ModernRIBs

final class AppComponent: Component<EmptyDependency>, AppRootDependency {

  init() {
    super.init(dependency: EmptyComponent())
  }
}
