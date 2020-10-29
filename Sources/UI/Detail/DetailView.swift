//
//  DetailView.swift
//  SampleApp
//
//  Created by Shinya Kumagai on 2020/10/29.
//

import SwiftUI

struct DetailView: View {
    
    let user: User
    
    @StateObject
    private var component: DetailComponent = .make()
    
    var body: some View {
        component.makeView(user: user)
    }
}

struct DetailContentView: View {
        
    @ObservedObject
    var viewModel: DetailViewModel
    
    var body: some View {
        /*@START_MENU_TOKEN@*/Text("Destination")/*@END_MENU_TOKEN@*/
    }
}
