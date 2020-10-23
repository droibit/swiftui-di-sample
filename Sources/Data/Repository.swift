//
//  Repository.swift
//  SampleApp
//
//  Created by Shinya Kumagai on 2020/10/23.
//

import Combine

struct ListData: Identifiable {
    let id: String
    let text: String
}

struct DetailData: Identifiable {
    let id: String
    let text: String
}

protocol Repository {
    
    func getList() -> AnyPublisher<[ListData], Never>
    
    func getDetail(by id: Int) -> AnyPublisher<DetailData, Never>
}
