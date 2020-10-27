//
//  MainUiState.swift
//  SampleApp
//
//  Created by Shinya Kumagai on 2020/10/25.
//

import Foundation

enum MainUiState {
    case inProgress(initial: Bool)
    case success(users: [User])
    
    var isInProgress: Bool {
        if case .inProgress = self {
            return true
        }
        return false
    }
}
