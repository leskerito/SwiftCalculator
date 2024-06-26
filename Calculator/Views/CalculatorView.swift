//
//  CalculatorView.swift
//  Calculator
//
//  Created by Franck Kindia on 21/06/2024.
//

import Foundation
import SwiftUI

struct CalculatorView: View {
    
    @ObservedObject var calcLogic = CalcLogic()
    
    var buttonTypes: [[ButtonType]] {
        [[.allClear, .negative, .percent, .operators(.division)],
         [.digit(.seven), .digit(.eight), .digit(.nine), .operators(.multiplication)],
         [.digit(.four), .digit(.five), .digit(.six), .operators(.subtraction)],
         [.digit(.one), .digit(.two), .digit(.three), .operators(.addition)],
         [.digit(.zero), .decimal, .equals]] 
    }
    
    var body: some View {
        VStack{
            Spacer()
            displayText
            buttonPad
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            
        }
        .padding(Constants.padding)
        .background(Color.black)
    }
}

#Preview {
    CalculatorView()
}
