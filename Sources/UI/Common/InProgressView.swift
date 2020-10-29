//
//  InProgressView.swift
//  SampleApp
//
//  Created by Shinya Kumagai on 2020/10/29.
//

import SwiftUI

// MARK: - InProgressView

struct InProgressView: View {
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
