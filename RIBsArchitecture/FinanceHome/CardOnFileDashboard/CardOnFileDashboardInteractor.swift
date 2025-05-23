//
//  CardOnFileDashboardInteractor.swift
//  RIBsArchitecture
//
//  Created by RAFA on 4/19/25.
//

import Combine

import ModernRIBs

protocol CardOnFileDashboardRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol CardOnFileDashboardPresentable: Presentable {

    var listener: CardOnFileDashboardPresentableListener? { get set }
    func update(with viewModels: [PaymentMethodViewModel])
}

protocol CardOnFileDashboardListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

protocol CardOnFileDashboardInteractorDependency {

    var cardOnFileRepository: CardOnFileRepository { get }
}

final class CardOnFileDashboardInteractor: PresentableInteractor<CardOnFileDashboardPresentable>, CardOnFileDashboardInteractable, CardOnFileDashboardPresentableListener {

    weak var router: CardOnFileDashboardRouting?
    weak var listener: CardOnFileDashboardListener?

    private let dependency: CardOnFileDashboardInteractorDependency
    private var cancellables: Set<AnyCancellable>

    init(
        dependency: CardOnFileDashboardInteractorDependency,
        presenter: CardOnFileDashboardPresentable
    ) {
        self.dependency = dependency
        self.cancellables = .init()
        super.init(presenter: presenter)

        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()

        dependency.cardOnFileRepository.cardOnFile.sink { methods in
            let viewModels = methods.prefix(5).map(PaymentMethodViewModel.init)
            self.presenter.update(with: viewModels)
        }.store(in: &cancellables)
    }

    override func willResignActive() {
        super.willResignActive()

        cancellables.forEach { $0.cancel() }
        cancellables.removeAll()
    }
}
