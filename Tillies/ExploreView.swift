//
//  ContentView.swift
//  Tillies
//
//  Created by Sawyer Cherry on 1/18/22.
//

import SwiftUI
import CoreData

struct ExploreView: View {
    
    var body: some View {
        NFTCardView()
            .cornerRadius(10)
    }
}



struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
            .preferredColorScheme(.dark)
    }
}
