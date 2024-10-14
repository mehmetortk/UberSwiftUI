//
//  HomeView.swift
//  UberSwiftUI
//
//  Created by Mehmet eren Ortak on 14.10.2024.
//

import SwiftUI

struct HomeView: View {
    //state keeps the local data and only the view that is state in can change it. In the other hand using binding allows us to control state from the other views that way we can change state value from other view which renders the whole view every time the state changes.
    @State private var showLocationSearchView = false
    
    var body: some View {
        ZStack (alignment: .top){
            UberMapViewRepresentable()
                .ignoresSafeArea()
            
            if showLocationSearchView{
                LocationSearchView()
            }
            else{
                LocationSearchActivationView()
                    .padding(.top, 72)
                    .onTapGesture {
                        withAnimation(.spring()){
                            showLocationSearchView.toggle()
                        }
                    }
            }
            
            MapViewActionButton(showLocationSearchView: $showLocationSearchView)
                .padding(.leading)
                .padding(.top,4)
        }
    }
}

#Preview {
    HomeView()
}
