//
//  calcViewExtension.swift
//  Calculator
//
//  Created by Franck Kindia on 24/06/2024.
//

import Foundation
import SwiftUI

extension CalculatorView{
    
    var displayText: some View {
        Text(calcLogic.display)
            .padding()
            .foregroundStyle(Color.white)
            .font(.system(size: 88, weight: .light))
            .frame(maxWidth: .infinity, alignment: .bottomTrailing)
            .lineLimit(1)
            .minimumScaleFactor(0.2)
    }
    
    var buttonPad: some View {
        VStack(spacing: Constants.padding){
            ForEach(buttonTypes, id: \.self){ row in
                HStack(spacing: Constants.padding){
                    ForEach(row, id: \.self){ buttonType in
                        CalculatorButton(buttonType: buttonType, calcLogic: $calcLogic)
                    }
                }
            }
        }
    }
}


