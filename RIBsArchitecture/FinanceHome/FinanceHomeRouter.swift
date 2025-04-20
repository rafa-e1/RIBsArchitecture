//
//  FinanceHomeRouter.swift
//  RIBsArchitecture
//
//  Created by RAFA on 4/1/25.
//

import ModernRIBs

protocol FinanceHomeInteractable: Interactable, SuperPayDashboardListener, CardOnFileDashboardListener {

    var router: FinanceHomeRouting? { get set }
    var listener: FinanceHomeListener? { get set }
}

protocol FinanceHomeViewControllable: ViewControllable {

    func addDashboard(_ view: ViewControllable)
}

final class FinanceHomeRouter: ViewableRouter<FinanceHomeInteractable, FinanceHomeViewControllable>, FinanceHomeRouting {

    private let superPayDashboardBuildable: SuperPayDashboardBuildable
    private let cardOnFileDashboardBuildable: CardOnFileDashboardBuildable
    private var superPayRouting: Routing?
    private var cardOnFileRouting: Routing?

    init(
        interactor: FinanceHomeInteractable,
        viewController: FinanceHomeViewControllable,
        superPayDashboardBuildable: SuperPayDashboardBuildable,
        cardOnFileDashboardBuildable: CardOnFileDashboardBuildable
    ) {
        self.superPayDashboardBuildable = superPayDashboardBuildable
        self.cardOnFileDashboardBuildable = cardOnFileDashboardBuildable
        super.init(interactor: interactor, viewController: viewController)

        interactor.router = self
    }

    func attachSuperPayDashboard() {
        if superPayRouting != nil {
            return
        }

        let router = superPayDashboardBuildable.build(withListener: interactor)
        let dashboard = router.viewControllable
        viewController.addDashboard(dashboard)

        self.superPayRouting = router
        attachChild(router)
    }

    func attachCardOnFileDashboard() {
        if cardOnFileRouting != nil {
            return
        }

        let router = cardOnFileDashboardBuildable.build(withListener: interactor)
        let dashboard = router.viewControllable
        viewController.addDashboard(dashboard)

        self.cardOnFileRouting = router
        attachChild(router)
    }
}
