//
//  Popup.swift
//  IATest
//
//  Created by Lumston on 16/02/21.
//

import SwiftUI

struct PopupData: Equatable, Hashable {
    var id: String = UUID().uuidString
    var showBanner: Bool = true
    var title: String
    var message: String
    var type: AlertGeneralType = .normal
}

struct Popup: View {
    @StateObject var notifyService: NotificationService = NotificationService.shared
    
    var body: some View {
        VStack {
            if self.notifyService.data != nil {
                ZStack {
                    Color.black.opacity(0.3)
                        .edgesIgnoringSafeArea(.vertical)

                    // This VStack is the popup
                    VStack(spacing: 20) {
                        Text("\(self.notifyService.data?.title ?? "titulo")")
                            .bold().padding()
                            .frame(maxWidth: .infinity)
                            .background(self.notifyService.data?.type.colorType)
                            .foregroundColor(Color.white)
                        
                        Text("\(self.notifyService.data?.message ?? "mensaje")")
                            .lineLimit(nil)
                            .padding()
                        
                        Button(action: {
                            self.notifyService.data = nil
                        }) {
                            Text("Cerrar")
                        }
                            .padding()
                    }
                    .frame(minWidth: 200, maxWidth: 300)
                    .background(Color.white)
                    .cornerRadius(20).shadow(radius: 20)
                }
                .animation(.easeInOut(duration: 0.5))
            } else {
                EmptyView()
            }
        }
    }
    
}

struct Popup_Previews: PreviewProvider {
    static var previews: some View {
        Popup()
    }
}
