//
//  PaymentMethod.swift
//  RIBsArchitecture
//
//  Created by RAFA on 4/21/25.
//

import Foundation

struct PaymentMethod: Decodable {
    let id: String
    let name: String
    let digits: String
    let color: String
    let isPrimary: Bool
}
