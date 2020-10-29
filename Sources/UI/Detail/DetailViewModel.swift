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
    
    private let disposeBag = DisposeBag()
    
    init(repository: Repository,
         schedulers: SchedulerProvider,
         user: User
    ) {
        self.repository = repository
        self.schedulers = schedulers
        self.user = user
    }
    
    deinit {
        print("deinit: \(type(of: self))")
    }
}
