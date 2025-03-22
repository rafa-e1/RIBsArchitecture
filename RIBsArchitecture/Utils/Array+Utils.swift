//
//  Array+Utils.swift
//  RIBsArchitecture
//
//  Created by RAFA on 3/22/25.
//

import Foundation

extension Array {

    subscript(safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}
