//
//  MainViewModel.swift
//  SampleApp
//
//  Created by Shinya Kumagai on 2020/10/25.
//

import Combine
import RxSwift

class MainViewModel: ObservableObject {
    
    private let repository: Repository
    
    private let schedulers: SchedulerProvider
    
    private let disposeBag = DisposeBag()
    
    @Published private (set) var uiState: MainUiState
    
    init(repository: Repository,
         schedulers: SchedulerProvider,
         uiState: MainUiState = .inProgress(initial: true)
    ) {
        self.repository = repository
        self.schedulers = schedulers
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
        
        repository.getUsers()
            .delay(.milliseconds(1_500), scheduler: schedulers.main)
            .subscribe(onSuccess: { [unowned self] users in
                self.uiState = .success(users: users)
            }).disposed(by: disposeBag)
    }
    
    func refresh() {
        if case .inProgress = uiState {
            return
        }
        uiState = .inProgress(initial: false)
        
        repository.getUsers()
            .delay(.milliseconds(1_500), scheduler: schedulers.main)
            .subscribe(onSuccess: { [unowned self] users in
                self.uiState = .success(users: users)
            }).disposed(by: disposeBag)
    }
}
