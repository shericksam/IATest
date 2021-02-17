//
//  
//  BillboardView.swift
//  IATest
//
//  Created by Erick Guerrero on 17/02/21.
//
//

import SwiftUI

struct BillboardView: View {
    
    // MARK: - Propertiers
    @StateObject private var viewModel: BillboardViewModel = .init()
    let data = (1...1000).map { "Item \($0)" }
//    let columns = [
//        GridItem(.adaptive(minimum: 100))
//    ]
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    // MARK: - View
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(data, id: \.self) { item in
                    BillboardItemView()
                }
            }
            .padding(.horizontal)
        }
    }
    
    // MARK: - funcs
}


struct BillboardView_Previews: PreviewProvider {
    static var previews: some View {
        BillboardView()
    }
}
