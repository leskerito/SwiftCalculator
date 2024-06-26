//
//  CalculatorApp.swift
//  Calculator
//
//  Created by Franck Kindia on 21/06/2024.
//

import SwiftUI

@main
struct CalculatorApp: App {
    
    @StateObject var calcLogic = CalcLogic()
    var body: some Scene {
        WindowGroup {
            CalculatorView()
        }
    }
}
