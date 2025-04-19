//
//  SuperPayDashboardBuilder.swift
//  RIBsArchitecture
//
//  Created by RAFA on 4/19/25.
//

import Foundation

import ModernRIBs

protocol SuperPayDashboardDependency: Dependency {

    var balance: ReadOnlyCurrentValuePublisher<Double> { get }
}

final class SuperPayDashboardComponent: Component<SuperPayDashboardDependency>, SuperPayDashboardInteractorDependency {

    var balance: ReadOnlyCurrentValuePublisher<Double> { dependency.balance }
    var balanceFormatter: NumberFormatter { Formatter.balanceFormatter }
}

// MARK: - Builder

protocol SuperPayDashboardBuildable: Buildable {
    func build(withListener listener: SuperPayDashboardListener) -> SuperPayDashboardRouting
}

final class SuperPayDashboardBuilder: Builder<SuperPayDashboardDependency>, SuperPayDashboardBuildable {

    override init(dependency: SuperPayDashboardDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: SuperPayDashboardListener) -> SuperPayDashboardRouting {
        let component = SuperPayDashboardComponent(dependency: dependency)
        let viewController = SuperPayDashboardViewController()
        let interactor = SuperPayDashboardInteractor(dependency: component, presenter: viewController)
        interactor.listener = listener
        return SuperPayDashboardRouter(interactor: interactor, viewController: viewController)
    }
}
