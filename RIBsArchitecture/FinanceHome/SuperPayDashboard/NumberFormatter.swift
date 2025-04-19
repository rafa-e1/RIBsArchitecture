//
//  NumberFormatter.swift
//  RIBsArchitecture
//
//  Created by RAFA on 4/19/25.
//

import Foundation

struct Formatter {

    static let balanceFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
}
