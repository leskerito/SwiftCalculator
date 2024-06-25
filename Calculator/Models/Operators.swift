//
//  Operators.swift
//  Calculator
//
//  Created by Franck Kindia on 21/06/2024.
//

import Foundation

enum Operators: CaseIterable, CustomStringConvertible {
    case addition, subtraction, division, multiplication
    
    var description: String {
        switch self {
        case .addition:
            return "+"
        case .subtraction:
            return "-"
        case .division:
            return "/"
        case .multiplication:
            return "x"
        }
    }
}
