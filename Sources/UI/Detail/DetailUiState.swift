//
//  DetailUiState.swift
//  SampleApp
//
//  Created by Shinya Kumagai on 2020/10/29.
//

import Foundation

enum DetailUiState {
    case inProgress(initial: Bool)
    case success(user: User, friends: [User])
}
