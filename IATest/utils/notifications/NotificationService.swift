//
//  NotificationService.swift
//  IATest
//
//  Created by Lumston on 16/02/21.
//

import Foundation
import UserNotifications
import SwiftUI
import UIKit
import CoreData

final class NotificationService: ObservableObject {
    static let shared: NotificationService = .init()
    @Published var data: PopupData? = nil
    @Published var showBanner = false
    @Published var bannerTitle: String = ""
    @Published var bannerDetail: String = ""
    @Published var bannerType: String = "normal"
    @Published var notifies: [PopupData] = []
    
    @Published var isShowAlert: Bool = false
    @Published var banner: BannerData?
    
    func showBanner(_ title: String, _ message: String, _ type: AlertGeneralType = .normal) {
        bannerTitle = title
        bannerDetail = message
        bannerType = type.rawValue
        showBanner = true
    }
}
