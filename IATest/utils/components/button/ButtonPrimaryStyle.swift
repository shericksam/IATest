//
//  ButtonSuccess.swift
//  IATest
//
//  Created by Erick Guerrero on 16/02/21.
//

import SwiftUI

struct ButtonPrimaryStyle: ButtonStyle {
    var color: Color = .primaryColor
    var hPadding: CGFloat = 20
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(
                !configuration.isPressed ?
                    color :
                    color.opacity(0.8)
            )
            .cornerRadius(5)
            .font(Font.body.bold())
            .padding(.horizontal, hPadding)
    }
}

struct ButtonSuccess_Previews: PreviewProvider {
    static var previews: some View {
        Button("btn", action: {})
            .buttonStyle(ButtonPrimaryStyle())
    }
}
