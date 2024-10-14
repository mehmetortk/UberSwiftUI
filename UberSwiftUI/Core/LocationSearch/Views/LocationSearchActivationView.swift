//
//  LocationSearchActivationView.swift
//  UberSwiftUI
//
//  Created by Mehmet eren Ortak on 14.10.2024.
//

import SwiftUI

struct LocationSearchActivationView: View {
    var body: some View {
        HStack {
            Image(systemName: "location.magnifyingglass")
                .resizable()
                .frame(width: 30, height: 30)
                .padding(.horizontal)
        
            Text("Where to ?")
                .foregroundColor(Color(.darkGray))
            
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width - 64, height: 50)
        .background(
            Rectangle()
                .fill(Color.white)
                .shadow(color: .black ,radius: 6)
        )
    }
}

#Preview {
    LocationSearchActivationView()
}
