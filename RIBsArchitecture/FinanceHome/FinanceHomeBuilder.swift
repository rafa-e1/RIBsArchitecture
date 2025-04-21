//
//  FinanceHomeBuilder.swift
//  RIBsArchitecture
//
//  Created by RAFA on 4/1/25.
//

import ModernRIBs

protocol FinanceHomeDependency: Dependency {

    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class FinanceHomeComponent: Component<FinanceHomeDependency>, SuperPayDashboardDependency, CardOnFileDashboardDependency {
    
    let cardOnFileRepository: CardOnFileRepository
    var balance: ReadOnlyCurrentValuePublisher<Double> { balancePublisher }

    private let balancePublisher: CurrentValuePublisher<Double>

    init(
        dependency: FinanceHomeDependency,
        cardOnFileRepository: CardOnFileRepository,
        balance: CurrentValuePublisher<Double>
    ) {
        self.cardOnFileRepository = cardOnFileRepository
        self.balancePublisher = balance
        super.init(dependency: dependency)
    }
}

// MARK: - Builder

protocol FinanceHomeBuildable: Buildable {

    func build(withListener listener: FinanceHomeListener) -> FinanceHomeRouting
}

final class FinanceHomeBuilder: Builder<FinanceHomeDependency>, FinanceHomeBuildable {

    override init(dependency: FinanceHomeDependency) {
        super.init(dependency: dependency)

    }

    func build(withListener listener: FinanceHomeListener) -> FinanceHomeRouting {
        let balancePublisher = CurrentValuePublisher<Double>(1000000000000)
        let component = FinanceHomeComponent(dependency: dependency, cardOnFileRepository: CardOnFileRepositoryImp(), balance: balancePublisher)
        let viewController = FinanceHomeViewController()
        let interactor = FinanceHomeInteractor(presenter: viewController)
        interactor.listener = listener

        let superPayDashboardBuilder = SuperPayDashboardBuilder(dependency: component)
        let cardOnFileDashboardBuilder = CardOnFileDashboardBuilder(dependency: component)

        return FinanceHomeRouter(
            interactor: interactor,
            viewController: viewController,
            superPayDashboardBuildable: superPayDashboardBuilder,
            cardOnFileDashboardBuildable: cardOnFileDashboardBuilder
        )
    }
}
