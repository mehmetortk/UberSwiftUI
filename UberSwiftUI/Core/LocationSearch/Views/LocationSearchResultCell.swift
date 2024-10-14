//
//  LocationSearchResultCell.swift
//  UberSwiftUI
//
//  Created by Mehmet eren Ortak on 14.10.2024.
//

import SwiftUI

struct LocationSearchResultCell: View {
    var body: some View {
        HStack{
            Image(systemName: "mappin.circle.fill")
                .resizable()
                .foregroundStyle(.blue)
                .tint(.white)
                .frame(width: 40 , height: 40)
            
            VStack(alignment: .leading, spacing: 4){
                Text("Starbucks Coffee")
                    .font(.body)
                
                Text("Kuzeykent, Kastamonu")
                    .font(.system(size: 15))
                    .foregroundStyle(.gray)
                
                Divider()
            }
            .padding(.leading, 8)
            .padding(.vertical, 8)
        }
        .padding(.leading)
    }
}

#Preview {
    LocationSearchResultCell()
}
