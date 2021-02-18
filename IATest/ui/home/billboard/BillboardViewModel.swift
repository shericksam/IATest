//
//  
//  BillboardViewModel.swift
//  IATest
//
//  Created by Erick Guerrero on 17/02/21.
//
//

import SwiftUI
import RetroSwift

class BillboardViewModel: ObservableObject {
    // MARK: - Propertiers
    lazy var notifier: NotificationService = { .shared }()
    private lazy var cinemaRepository: CinemaRepository = { .shared }()
    
    // MARK: - funcs
    func getMovies() {
        Coroutines.io {
            do {
                let request = BillboardRequest(cinema: 61)
                _ = try self.cinemaRepository.getCinemas(request)
                Coroutines.main {
                    MyCoreBack.shared.background.saveIfNeeded()
                    MyCoreBack.shared.main.saveIfNeeded()
                }
            } catch let error as ApiErrorModel {
                Coroutines.main {
                    print("error getMovies", error.localizedDescription)
                    self.notifier.showBanner("error", error.localizedDescription, .danger)
                }
            }
        }
    }
}
