import SwiftUI

struct MainView: View {
    
    var body: some View {
        MainContentView()
    }
}


// MARK: - Content

struct MainContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct MainContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainContentView()
    }
}
