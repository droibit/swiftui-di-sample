import Combine
import SwiftUI

struct MainView: View {
    
    // TODO: Neeed to refactor
    @EnvironmentObject var appComponent: AppComponent
    
    var body: some View {
        appComponent.main.makeView()
    }
}


// MARK: - Content

struct MainContentView: View {
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        Group {
            switch viewModel.uiState {
            case .inProgress:
                InProgressView()
            case .success(let users):
                UserListView(users: users)
            }
        }.onAppear(perform: viewModel.onAppear)
    }
        
    func userListView(with users: [User]) -> some View {
        Text("TODO")
            .padding()
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
        Text("TODO")
            .padding()
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView(users: [])
    }
}
