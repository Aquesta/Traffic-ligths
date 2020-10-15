//
//  ContentView.swift
//  Traffic ligths
//
//  Created by Aquesta 's on 15.10.2020.
//

import SwiftUI

enum CurrentLight {
    case red, yellow, green
}

enum Light: Double {
    case On = 1.0
    case Off = 0.3
}

struct ContentView: View {
    @State var buttonText = "START"
    @State var currentLight = CurrentLight.red
    @State var redLight = Light.Off.rawValue
    @State var yellowLigtht = Light.Off.rawValue
    @State var greenLight = Light.Off.rawValue
    
    var body: some View {
        
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack {
                ligth(color: .red, opacity: redLight)
                ligth(color: .yellow, opacity: yellowLigtht)
                ligth(color: .green, opacity: greenLight)
                
                Spacer()
                Button(action: {
                    changeLight(currentLight: currentLight)
                }) {
                    Text(buttonText)
                    .fontWeight(.bold)
                    .font(.body)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .padding(10)
                    .border(Color.blue, width: 5)
                }
            }.padding(.bottom, 80)
        }
    }
    
    private func changeLight(currentLight: CurrentLight) {
        buttonText = "NEXT"
        switch currentLight {
        
        case .red:
            redLight = Light.On.rawValue
            yellowLigtht = Light.Off.rawValue
            greenLight = Light.Off.rawValue
            self.currentLight = CurrentLight.yellow
        case .yellow:
            redLight = Light.Off.rawValue
            yellowLigtht = Light.On.rawValue
            greenLight = Light.Off.rawValue
            self.currentLight = CurrentLight.green
        case .green:
            redLight = Light.Off.rawValue
            yellowLigtht = Light.Off.rawValue
            greenLight = Light.On.rawValue
            self.currentLight = CurrentLight.red
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}

struct ligth: View {
    var color = UIColor.black
    var opacity = 1.0
    
    var body: some View {
        Color(color)
            .clipShape(Circle())
            .frame(width: 120, height: 120, alignment: .center)
            .opacity(opacity)
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
    }
}
