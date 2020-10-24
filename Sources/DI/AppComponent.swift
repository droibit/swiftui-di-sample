//
//  AppComponent.swift
//  SampleApp
//
//  Created by Shinya Kumagai on 2020/10/21.
//

import RxSwift
import NeedleFoundation

class AppComponent: BootstrapComponent {
}

// MARK: - Data

extension AppComponent {
    var repository: Repository {
        shared {
            RepositoryImpl(schedulers: schedulers)
        }
    }
    
    var schedulers: SchedulerProvider {
        shared {
            SchedulerProvider(
                main: MainScheduler.instance,
                background: ConcurrentDispatchQueueScheduler(qos: .userInitiated)
            )
        }
    }
}
