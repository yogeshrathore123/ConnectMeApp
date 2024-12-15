//
//  CapsuleButtonStyle.swift
//  ConnectMe
//
//  Created by Yogesh Rathore on 15/12/24.
//

import SwiftUI


struct CapsuleButtonStyle: ButtonStyle {
    var bgColour: Color = .teal
    var textColour: Color = .white
    var hasBorder: Bool = false
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(textColour)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Capsule().fill(bgColour))
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .overlay {
                hasBorder ? Capsule().stroke(.gray, lineWidth: 1) : nil
            }
    }
}
