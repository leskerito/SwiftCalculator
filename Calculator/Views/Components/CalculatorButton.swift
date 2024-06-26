//
//  CalculatorButton.swift
//  Calculator
//
//  Created by Franck Kindia on 21/06/2024.
//

import Foundation
import SwiftUI

extension CalculatorView {
    
    struct CalculatorButton: View {
    
        let buttonType: ButtonType
        var calcLogic: CalcLogic
        
        var body: some View {
            Button(buttonType.description){
                calcLogic.expression(bt: buttonType)
            }
                .buttonStyle(CalculatorButtonStyle(size: getButtonSize(), foregroundStyle: buttonType.foregroundStyle, background: buttonType.backgroundColor, isWide: buttonType  == .digit(.zero)))
        }
        
        private func getButtonSize() -> CGFloat {
            let screenWidth = UIScreen.main.bounds.width
            let buttonCount: CGFloat = 4.0
            let spacingCount = buttonCount + 1
            return (screenWidth - (spacingCount * Constants.padding)) / buttonCount
        }
    }
}
