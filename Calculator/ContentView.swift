//
//  ContentView.swift
//  Calculator
//
//  Created by Franck Kindia on 21/06/2024.
//

import SwiftUI

struct ContentView: View {
    let calcLogic = CalcLogic()
    let columns: [GridItem] = [GridItem(.adaptive(minimum: 10, maximum: 100)), GridItem(.adaptive(minimum: 10, maximum: 100)), GridItem(.adaptive(minimum: 10, maximum: 100)), GridItem(.adaptive(minimum: 10, maximum: 100))]
    var body: some View {
        VStack(){
            VStack(){
                Text("History")
                    .font(.largeTitle)
                Text("Result")
                    .font(.largeTitle)
                    .bold()
            }
            
            .frame(maxWidth: .infinity, minHeight: 300, alignment: .bottomTrailing)
            .background(Color.gray)
            LazyVGrid(columns: columns){
                ForEach(1...3, id: \.self){ i in
                    Button(String(i)){
                        print(calcLogic.expression)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
