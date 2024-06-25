//
//  CalcLogic.swift
//  Calculator
//
//  Created by Franck Kindia on 21/06/2024.
//

import Foundation

extension Double {
    func toInt() -> Int? {
        if self >= Double(Int.min) && self < Double(Int.max) {
            return Int(self)
        } else {
            return nil
        }
    }
}

class CalcLogic: ObservableObject {
    var display: String = "Hello" //Whatever will be displayed on the calculator display
    var expStack = Stack() // Handles all the calculations
    var history = [Double]() // Keeps in memory the previous results
    var current = ""
    
    func expression(bt: ButtonType){
        switch bt {
            case .digit(digits: let d):
                if current.isOperator {
                    expStack.push(current)
                    current = d.description
                } else {
                    current += d.description
                }
            case .operators(_):
                if current.isOperator {
                    expStack.drop()
                    print("Can't do two op's in a row dawg")
                }
                current = bt.description
                expStack.push(current)
            case .negative:
                if current[current.startIndex] == "-" {
                    current.remove(at: current.startIndex)
                } else {
                    current.insert("-", at: current.startIndex)
                }
            case .equals:
                print("Calculating \(current) and the elements of \(expStack.description)")
            case .percent:
                if current.isOperator {}
                else {
                    let currentDouble = Double(current)
                    guard let currentDouble = currentDouble else {
                        print("That is NOT a number dawg")
                        return
                    }
                    
                    let percent = currentDouble / 100
                    current = percent.description
                    expStack.emptyStack()
                    expStack.push(current)
                }
            case .decimal:
                if current.contains(",") { } else {
                    current += ","
                }
            case .clear:
                current = ""
            case .allClear:
                current = ""
                expStack.emptyStack()
        }
        
        print(bt.description)
    }
}

extension String {
    var isOperator: Bool {
        switch self {
        case "+", "-", "/", "x":
            return true
        default:
            return false
        }
    }
}
