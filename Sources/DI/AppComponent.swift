//
//  AppComponent.swift
//  SampleApp
//
//  Created by Shinya Kumagai on 2020/10/21.
//

import NeedleFoundation
import RxSwift
import UIKit

class AppComponent: BootstrapComponent, ObservableObject {
}

// MARK: - Subcomponents

extension AppComponent {
    var main: MainComponent {
        MainComponent(parent: self)
    }
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
