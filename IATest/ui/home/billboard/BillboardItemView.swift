//
//  
//  BillboardItemView.swift
//  IATest
//
//  Created by Erick Guerrero on 17/02/21.
//
//

import SwiftUI

struct BillboardItemView: View {
    
    // MARK: - Propertiers
//    var movie
    
    // MARK: - View
    var body: some View {
        NavigationLink(destination: BillboardDetailsView()) {
            VStack {
                Image(systemName: "tray.circle")
                    .resizable()
                    .frame(minHeight: 150)
                Text("Hello world")
            }
        }
    }
    
    // MARK: - funcs
}


struct BillboardItemView_Previews: PreviewProvider {
    static var previews: some View {
        BillboardItemView()
    }
}
