//
//  Digits.swift
//  Calculator
//
//  Created by Franck Kindia on 21/06/2024.
//

import Foundation

enum Digits: Int, CaseIterable, CustomStringConvertible {
    case zero, one, two, three, four, five, six, seven, eight, nine
    
    var description: String {
        "\(rawValue)"
    }
}
