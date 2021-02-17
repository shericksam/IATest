//
//  BannerModifier.swift
//  IATest
//
//  Created by Lumston on 16/02/21.
//

import SwiftUI

struct BannerData {
    var title: String
    var detail: String
    var type: AlertGeneralType
}

struct BannerModifier: ViewModifier {
    @State var task: DispatchWorkItem?
    @EnvironmentObject var observer : NotificationService
    @State var draggOffSet = CGSize.zero
    
    func body(content: Content) -> some View {
        ZStack {
            content
                .transition(.slide)
            if observer.showBanner {
                VStack {
                    HStack {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("\(observer.bannerTitle.localized)")
                                .bold()
                            Text("\(observer.bannerDetail.localized)")
                                .font(Font.system(size: 15, weight: Font.Weight.light, design: Font.Design.default))
                        }
                        Spacer()
                    }
                    .foregroundColor(Color.white)
                    .padding(12)
                    .background(type.colorType)
                    .cornerRadius(8)
                    .shadow(radius: 20)
                    Spacer()
                }
                    .padding()
                    .offset(y: self.draggOffSet.height)
                    .gesture(
                        DragGesture(minimumDistance: 0, coordinateSpace: .local)
                            .onChanged({ (value) in
                                if value.translation.height < 0 && value.translation.width < 100 && value.translation.width > -100 {
                                    
                                    self.draggOffSet  = value.translation
                                }
                            })
                        .onEnded({ value in
                            withAnimation(.easeIn) {
                                observer.showBanner = false
                                self.draggOffSet = .zero
                            }
                        }))
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 15)) {
                            observer.showBanner = false
                        }
                    }
                    .onAppear {
    //                    print("onAppear", self.show)
                        self.task = DispatchWorkItem {
                            withAnimation(.easeOut(duration: 3)) {
                                observer.showBanner = false
                            }
                        }
                        // Auto dismiss after 5 seconds, and cancel the task if view disappear before the auto dismiss
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: self.task!)
                    }
                    .onDisappear {
                        self.task?.cancel()
                    }
                    .transition(
                        AnyTransition
                            .move(edge: .top)
                            .combined(with: .opacity)
                    )
            }
        }
        .animation(.spring())
    }
    
    var type: AlertGeneralType {
        AlertGeneralType(rawValue: observer.bannerType) ?? .normal
    }
}

extension View {
    func banner() -> some View {
        return self.modifier(BannerModifier())
    }
}
