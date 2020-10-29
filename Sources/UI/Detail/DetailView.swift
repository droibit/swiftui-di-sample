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
        Group {
            switch viewModel.uiState {
            case .inProgress:
                InProgressView()
            case let .success(user, friends):
                UserDetailView(user: user, friends: friends)
            }
        }
        .navigationBarTitle(Text("Detail"), displayMode: .inline)
        .onAppear(perform: viewModel.onAppear)
    }
}

private struct UserDetailView: View {
    let user: User
    let friends: [User]
    
    var body: some View {
        VStack(alignment: .center) {
            Text("\(user.name)'s friend(s)")
                .font(.title3)
                .padding()
            
            VStack(alignment: .leading) {
                ForEach(friends) { friend in
                    Label(
                        title: {
                            Text("\(friend.name)")
                                .font(.body)
                                .foregroundColor(.gray)
                                .padding(.bottom, 4)
                        },
                        icon: {
                            Image(systemName: "person.circle")          .foregroundColor(.gray)
                        }
                    )
                }
            }

        }
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserDetailView(
                user: User(id: "1", name: "Taro Tanaka"),
                friends: [
                    .init(id: "2", name: "Ichiro Suzuki"),
                    .init(id: "3", name: "Jiro Tanaka"),
                    .init(id: "4", name: "Hanako Suzuki")
                ]
            )
        }
    }
}
