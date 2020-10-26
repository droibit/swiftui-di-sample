//
//  AppComponent.swift
//  SampleApp
//
//  Created by Shinya Kumagai on 2020/10/21.
//

import NeedleFoundation
import RxSwift
import SwiftUI
import UIKit

class AppComponent: BootstrapComponent {
    static let instance: AppComponent = .init()
}

@available(*, deprecated, message: "Depcated.")
@propertyWrapper
struct Subcomponent<Value: Scope> {
    var wrappedValue: Value {
        AppComponent.instance[keyPath: keyPath]
    }
    
    private let keyPath: KeyPath<AppComponent, Value>
    
    init(_ keyPath: KeyPath<AppComponent, Value>) {
        self.keyPath = keyPath
    }
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
