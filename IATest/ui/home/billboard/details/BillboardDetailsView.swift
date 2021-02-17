//
//  
//  BillboardDetailsView.swift
//  IATest
//
//  Created by Erick Guerrero on 17/02/21.
//
//

import SwiftUI

struct BillboardDetailsView: View {
    
    // MARK: - Propertiers
    
    // MARK: - View
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("name")
                    Text("")
                    Spacer()
                }
                
                HStack {
                    Text("classification")
                    Text("")
                    Spacer()
                }
                
                HStack {
                    Text("genre")
                    Text("")
                    Spacer()
                }
                
                HStack {
                    
                    Text("duration")
                    Text("")
                    Spacer()
                }
                
                VStack {
                    HStack {
                        Text("synopsis")
                        Spacer()
                    }
                    Text("")
                }
            }
        }
        .navigationBarTitle("movie-detail")
    }
    
    // MARK: - funcs
}


struct BillboardDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        BillboardDetailsView()
    }
}
