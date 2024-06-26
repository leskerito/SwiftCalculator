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
    @Published var display: String = "0" //Whatever will be displayed on the calculator display
    var expStack = Stack() // Handles all the calculations
    var history = [Double]() // Keeps in memory the previous results//
    var current = "" // Keeps the last input
    
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
                } else {
                    expStack.push(current)
                }
                current = bt.description
            case .negative:
                if current.contains(/[0-9]/){
                    if current[current.startIndex] == "-" {
                        current.remove(at: current.startIndex)
                    } else {
                        current.insert("-", at: current.startIndex)
                    }
                } else {
                    print("tf does negative \(current) mean dawg")
                }
            case .equals:
            if expStack.count() > 1 {
                    expStack.push(current)
                    calculate()
                }
                calcDisplay()
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
                }
            case .decimal:
                if current.contains(",") { } 
                else if current.isOperator {
                    expStack.push(current)
                    current = "0,"
                } else {
                    current += ","
                }
            case .clear:
                if current.count >= 1{
                    current.removeLast()
                } else {
                    fallthrough
                }
            case .allClear:
                current = ""
                display = "0"
                expStack.emptyStack()
        }
        print(expStack, "Expression")
        calcDisplay()
    }
    
    func calculate(){
        var expressionArray = [String]()
        if expStack.count() < 2 {
            return print(expStack, "Calculate < 2")
        }
        while !expStack.isStackEmpty() {
            var num = expStack.pop()
            if num.contains(","){
                let pref = num.prefix(upTo: num.firstIndex(of: ",")!).description
                let suf = num.suffix(from: num.index(after: num.firstIndex(of: ",")!)).description
                num = pref + "." + suf
            }
            expressionArray.insert(num, at: 0)
        }
        guard let number1 = Double(expressionArray.removeFirst()), let number2 = Double(expressionArray.removeLast()) else {
            return print("The numbers are NOT numbers.")
        }
            var result = 0.0
            if expressionArray.count == 1 {
                switch expressionArray[0] {
                case "+":
                    result = number1 + number2
                case "-":
                    result = number1 - number2
                case "/":
                    result = number1 / number2
                case "x":
                    result = number1 * number2
                default:
                    result = 80085.0
                }
            } else {
                return print("Stack error. The stack had too many groups")
            }
        current = result.description
    }
    
    func calcDisplay(){
        if current == "" {
            display = "0"
        } else if current.contains(/.[0-9]+/) {
            display = current.replacingOccurrences(of: ".", with: ",")
        }
        if current.hasSuffix(".0"){
            let pref = current.prefix(upTo: current.firstIndex(of: ".")!).description
            display = pref
            current = pref
        } else {
            display = current
        }
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
