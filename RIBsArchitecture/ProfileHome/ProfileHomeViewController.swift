//
//  ProfileHomeViewController.swift
//  RIBsArchitecture
//
//  Created by RAFA on 3/23/25.
//

import UIKit

import ModernRIBs

protocol ProfileHomePresentableListener: AnyObject {

    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class ProfileHomeViewController: UIViewController, ProfileHomePresentable, ProfileHomeViewControllable {

    weak var listener: ProfileHomePresentableListener?

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
