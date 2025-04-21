//
//  PaymentMethodView.swift
//  RIBsArchitecture
//
//  Created by RAFA on 4/21/25.
//

import UIKit

final class PaymentMethodView: UIView {

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()

    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()

    init(viewModel: PaymentMethodViewModel) {
        super.init(frame: .zero)

        setupViews()

        nameLabel.text = viewModel.name
        subtitleLabel.text = viewModel.digits
        backgroundColor = viewModel.color
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setupViews()
    }

    private func setupViews() {
        addSubview(nameLabel)
        addSubview(subtitleLabel)

        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),

            subtitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            subtitleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
