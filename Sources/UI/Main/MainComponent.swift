//
//  MainComponent.swift
//  SampleApp
//
//  Created by Shinya Kumagai on 2020/10/25.
//

import Foundation
import NeedleFoundation

protocol MainDependency: Dependency {
    var repository: Repository { get }
    var schedulers: SchedulerProvider { get }
}

class MainComponent: Component<MainDependency>, ObservableObject {
        
    deinit {
        print("deinit: \(type(of: self))")
    }
    
    private var viewModel: MainViewModel {
        shared {
            MainViewModel(
                repository: dependency.repository,
                schedulers: dependency.schedulers
            )
        }
    }
    
    func makeView() -> MainContentView {
        MainContentView(viewModel: viewModel)
    }
}

extension MainComponent {
    static func make() -> MainComponent {
        return AppComponent.instance.main
    }
}
