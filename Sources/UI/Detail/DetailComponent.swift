//
//  DetailComponent.swift
//  SampleApp
//
//  Created by Shinya Kumagai on 2020/10/29.
//

import Foundation
import NeedleFoundation

protocol DetailDependency: Dependency {
    var repository: Repository { get }
    var schedulers: SchedulerProvider { get }
}

class DetailComponent: Component<DetailDependency>, ObservableObject {
    deinit {
        print("deinit: \(type(of: self))")
    }
    
    func makeView(user: User) -> DetailContentView {
        return DetailContentView(viewModel: buildViewModel(user: user))
    }
    
    private func buildViewModel(user: User) -> DetailViewModel {
        shared {
            DetailViewModel(
                repository: dependency.repository,
                schedulers: dependency.schedulers,
                user: user
            )
        }
    }
}

extension DetailComponent {
    static func make() -> DetailComponent {
        AppComponent.instance.detail
    }
}

