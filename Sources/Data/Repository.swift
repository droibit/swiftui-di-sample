//
//  Repository.swift
//  SampleApp
//
//  Created by Shinya Kumagai on 2020/10/23.
//

import Combine

protocol Repository {
    
    func getUsers() -> AnyPublisher<[User], Never>
    
    func getFriends(by id: Int) -> AnyPublisher<[User], Never>
}

class RepositoryImpl: Repository {
    func getUsers() -> AnyPublisher<[User], Never> {
        Just(users.enumerated().map { User(id: "\($0.offset)", name: $0.element) })
            .eraseToAnyPublisher()
    }
    
    func getFriends(by id: Int) -> AnyPublisher<[User], Never> {
        let friends = users.shuffled().prefix(Int.random(in: 1...3))
        return Just(friends.enumerated().map { User(id: "\($0.offset)", name: $0.element) })
            .eraseToAnyPublisher()
    }
}

// MARK - Sample Data

// ref. https://www.name-generator.org.uk/quick/
private let users: [String] = [
    "Random Names",
    "Maison Kearney",
    "Digby Gomez",
    "Ebony Mcintyre",
    "Mario Duffy",
    "Farhan Roach",
    "Hanna Redmond",
    "Danial Bonilla",
    "Felicia Mcnally",
    "Veronica Talbot",
    "Lola-Mae Robertson",
    "Pedro Oneal",
    "Masuma Hollis",
    "Emmie Reynolds",
    "Ibrahim Horton",
    "Shakil Jimenez",
    "Fintan Hawes",
    "Bree Duncan",
    "Amber-Rose Rich",
    "Reem Tillman",
    "Julius Redman",
    "Lillie York",
    "Madihah Watts",
    "Robin Cantrell",
    "Izabella Galvan",
    "Cobie Andrews",
    "Nathanial Correa",
    "Usman Frost",
    "Bayley Reilly",
    "Aden Kearns",
    "Amanda Lyon"
]
