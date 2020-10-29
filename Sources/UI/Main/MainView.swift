import Combine
import SwiftUI

struct MainView: View {
    
    @StateObject
    private var component: MainComponent = .make()
    
    var body: some View {
        component.makeView()
    }
}


// MARK: - Content

struct MainContentView: View {
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        NavigationView {
            Group {
                switch viewModel.uiState {
                case .inProgress:
                    InProgressView()
                case .success(let users):
                    UserListView(users: users)
                }
            }
            .onAppear(perform: viewModel.onAppear)
            .navigationBarTitle(Text("Main"), displayMode: .inline)
            .navigationBarItems(trailing: Button(action: viewModel.refresh, label: {
                Image(systemName: "arrow.counterclockwise")
                    .disabled(viewModel.uiState.isInProgress)
            }))
        }
    }
}

// MARK: - InProgressView

private struct InProgressView: View {
    var body: some View {
        ProgressView("Loading...")
            .progressViewStyle(CircularProgressViewStyle(tint: .gray))
            .foregroundColor(.black)
            .padding()
    }
}

struct InProgressView_Previews: PreviewProvider {
    static var previews: some View {
        InProgressView()
    }
}

// MARK: - UserListView

private struct UserListView: View {
    let users: [User]
    
    var body: some View {
        List {
            Section(
                header: Text("Users").textCase(.none),
                footer: Text("\(users.count) users.")
            ) {
                ForEach(users) { user in
                    NavigationLink(destination: /*@START_MENU_TOKEN@*/Text("Destination")/*@END_MENU_TOKEN@*/) {
                        UserRow(user: user)
                    }
                }
            }
        }.listStyle(GroupedListStyle())
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        let users = [
            "Random Names",
            "Maison Kearney",
            "Digby Gomez",
            "Ebony Mcintyre",
            "Mario Duffy",
            "Farhan Roach",
        ]
        .enumerated().map { User(id: "\($0.offset)", name: $0.element) }
        
        UserListView(users: users)
    }
}

private struct UserRow: View {
    
    let user: User
    
    var body: some View {
        HStack {
            Text(String(user.name.prefix(1).uppercased()))
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: 44, height: 44)
                .background(
                    Circle()
                        .strokeBorder(Color.blue, lineWidth: 1)
                        .background(
                            Circle().fill(Color.gray)
                        )
                )

            
            Text(user.name)
                .font(.title3)
            
            Spacer()
        }.padding([.vertical], 4)
    }
}

struct UserRow_Previews: PreviewProvider {
    static var previews: some View {
        UserRow(user: User(id: "1", name: "Taro Tanaka"))
    }
}

