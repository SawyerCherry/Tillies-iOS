//
//  NFTCardView.swift
//  Tillies
//
//  Created by Sawyer Cherry on 1/18/22.
//

import SwiftUI

struct NFTCardView: View {
    
    var model: NFTModel
    
    var body: some View {
        
        Image("dogeneo")
            .resizable()
            .cornerRadius(24)
            .scaledToFit()
            .frame(minWidth: 0, maxWidth: .infinity)
            .overlay(
                VStack(alignment: .center, spacing: 12) {
                    Text("Neoge")
                        .foregroundColor(Color.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .shadow(radius: 1)
                        .padding(.horizontal, 18)
                        .padding(.vertical, 4)
                        .overlay(
                            Rectangle()
                                .fill(Color.white)
                                .frame(height: 1),
                            alignment: .bottom
                        )
                    Text("#ax122ndxxae12")
                        .foregroundColor(Color.black)
                        .font(.footnote)
                        .fontWeight(.bold)
                        .frame(minWidth: 85)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(
                            Capsule().fill(Color.white)
                        )
                }
                    .frame(minWidth: 280)
                    .padding(.bottom, 50),
                alignment: .bottom
            )
    }
}

//struct NFTCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        NFTCardView(model: NFTModel())
//            .preferredColorScheme(.dark)
//    }
//}
