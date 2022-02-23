//
//  HeaderView.swift
//  Tillies
//
//  Created by Sawyer Cherry on 1/24/22.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Button(action: {}, label: {
                Image(systemName: "magnifyingglass")
                    .font(.title)
                    .foregroundColor(.black)
            })
            
            Spacer()
            
            HeaderView()
            
            Spacer()
            
            Button(action: {}, label: {
                Image(systemName: "square.grid.2x2")
                    .font(.title)
                    .foregroundColor(.black)
            })
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
