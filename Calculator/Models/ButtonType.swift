//
//  ButtonType.swift
//  Calculator
//
//  Created by Franck Kindia on 21/06/2024.
//

import Foundation
import SwiftUI

enum ButtonType: Hashable, CustomStringConvertible {
    case digit(_ digit: Digits)
    case operators(_ operators: Operators)
    case negative
    case percent
    case decimal
    case equals
    case allClear
    case clear
    
    var backgroundColor: Color {
        switch self {
            case .digit(_):
                fallthrough
            case .decimal:
                return  .secondary
            case .operators(_):
                fallthrough
            case .equals:
                return .orange
            default:
                return Color(.lightGray)
        }
    }
    
    var foregroundStyle: Color {
        switch self {
        case .allClear, .percent, .negative, .clear:
            return .black
        default:
            return .white
        }
    }
    
    var description: String {
        switch self {
            case .digit(let digit):
                return digit.description
            case .operators(let op):
                return op.description
            case .negative:
                return "±"
            case .percent:
                return "%"
            case .decimal:
                return "."
            case .equals:
                return "="
            case .allClear:
                return "AC"
            case .clear:
                return "C"
        }
    }
}
