//
//  DetailViewModel.swift
//  SampleApp
//
//  Created by Shinya Kumagai on 2020/10/29.
//

import Combine
import RxSwift

class DetailViewModel: ObservableObject {
    
    private let repository: Repository
    
    private let schedulers: SchedulerProvider
    
    private let user: User
    
    @Published private (set) var uiState: DetailUiState
    
    private let disposeBag = DisposeBag()
    
    init(repository: Repository,
         schedulers: SchedulerProvider,
         user: User,
         uiState: DetailUiState = .inProgress(initial: true)
    ) {
        self.repository = repository
        self.schedulers = schedulers
        self.user = user
        self.uiState = uiState
    }
    
    deinit {
        print("deinit: \(type(of: self))")
    }
    
    func onAppear() {
        guard case .inProgress(let initial) = uiState, initial else {
            return
        }
        uiState = .inProgress(initial: false)
        
        repository.getFriends(by: user.id)
            .delay(.milliseconds(1_500), scheduler: schedulers.main)
            .subscribe(onSuccess: { [unowned self] friends in
                self.uiState = .success(user: user, friends: friends)
            }).disposed(by: disposeBag)
    }
}
