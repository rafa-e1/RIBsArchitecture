//
//  FinanceHomeInteractor.swift
//  RIBsArchitecture
//
//  Created by RAFA on 4/1/25.
//

import ModernRIBs

protocol FinanceHomeRouting: ViewableRouting {

    func attachSuperPayDashboard()
    func attachCardOnFileDashboard()
}

protocol FinanceHomePresentable: Presentable {

    var listener: FinanceHomePresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol FinanceHomeListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class FinanceHomeInteractor: PresentableInteractor<FinanceHomePresentable>, FinanceHomeInteractable, FinanceHomePresentableListener {

    weak var router: FinanceHomeRouting?
    weak var listener: FinanceHomeListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: FinanceHomePresentable) {
        super.init(presenter: presenter)

        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()

        router?.attachSuperPayDashboard()
        router?.attachCardOnFileDashboard()
    }

    override func willResignActive() {
        super.willResignActive()
        
        // TODO: Pause any business logic.
    }
}
