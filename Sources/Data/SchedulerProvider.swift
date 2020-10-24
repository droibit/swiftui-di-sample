//
//  SchedulerProvider.swift
//  SampleApp
//
//  Created by Shinya Kumagai on 2020/10/25.
//

import RxSwift

class SchedulerProvider {
    let main: SchedulerType
    let background: SchedulerType
    
    init(main: SchedulerType, background: SchedulerType) {
        self.main = main
        self.background = background
    }
}
