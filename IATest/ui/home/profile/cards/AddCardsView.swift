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
