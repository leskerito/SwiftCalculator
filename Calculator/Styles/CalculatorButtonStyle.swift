//
//  CalculatorButtonStyles.swift
//  Calculator
//
//  Created by Franck Kindia on 21/06/2024.
//

import Foundation
import SwiftUI

struct CalculatorButtonStyle: ButtonStyle {
    
    var size: CGFloat
    var foregroundStyle: Color
    var background: Color
    var isWide: Bool = false
    
    func makeBody(configuration: Configuration) -> some View {
                configuration.label
                    .font(.system(size: 32, weight: .medium))
                    .frame(width: size, height: size)
                    .frame(maxWidth: isWide ? .infinity : size, alignment: .leading)
                    .background(background)
                    .foregroundColor(foregroundStyle)
                    .overlay {
                        if configuration.isPressed {
                            Color(white: 1.0, opacity: 0.2)
                        }
                    }
                    .clipShape(Capsule())
        }
}
