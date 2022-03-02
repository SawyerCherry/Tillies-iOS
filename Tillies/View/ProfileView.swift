//
//  ProfileView.swift
//  Tillies
//
//  Created by Sawyer Cherry on 1/19/22.
//

import SwiftUI
import FCLAuthSwift

struct ProfileView: View {
    // TODO: build VM that fetches NFTs given the current user's address

    @ObservedObject var viewModel = ProfileViewModel()

    @AppStorage("userAddress") var userAddress: String!
    
    var body: some View {
        NavigationView {
            ScrollView {
                HStack {
                    VStack(spacing: 10) {
                        Text("Wallet Address")
                            .font(.title2)
                            .fontWeight(.semibold)
                        Text(userAddress)
                            .fontWeight(.light)
                    }
                    .padding()
                    .background(
                        Color.green
                            .cornerRadius(10)
                    )
                    
                    VStack {
                        Text("NFT's owned")
                            .font(.title2)
                            .fontWeight(.semibold)
                            
                        Text("36")
                            .font(.title)
                            .fontWeight(.light)
                    }
                    .padding()
                    .background(
                        Color.green
                            .cornerRadius(10)
                    )
                    
                }//: Stack
                
                HStack {
                    Text("My NFT's")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.horizontal, 20)
                    Spacer()
                }
            }
            .navigationTitle("Sawyer Cherry")
            .background(MotionAnimationView().ignoresSafeArea())
        }
    }
}
    




struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
