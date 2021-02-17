//
//  
//  AddCardsView.swift
//  IATest
//
//  Created by Erick Guerrero on 17/02/21.
//
//

import SwiftUI

struct AddCardsView: View {
    
    // MARK: - Propertiers
    @EnvironmentObject var viewModel: ProfileViewModel
    
    // MARK: - View
    var body: some View {
        VStack {
            TextField("card-number", text: $viewModel.cardNumber)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            TextField("pin", text: $viewModel.pin)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .padding()
            Button("check", action: viewModel.checkCard)
            
            if self.viewModel.level != nil {
                HStack {
                    Text("level")
                    Spacer()
                    Text(self.viewModel.level!.name)
                }
                HStack {
                    Text("next-level")
                    Spacer()
                    Text(self.viewModel.level!.nextLevel)
                }
                HStack {
                    Text("message")
                    Spacer()
                    Text(self.viewModel.level!.message)
                }
            }
            Spacer()
        }
        .navigationBarTitle("check-card")
    }
    
    // MARK: - funcs
}


struct AddCardsView_Previews: PreviewProvider {
    static var previews: some View {
        AddCardsView()
    }
}
