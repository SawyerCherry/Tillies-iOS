//
//  LoginView.swift
//  Tillies
//
//  Created by Sawyer Cherry on 1/24/22.
//

import SwiftUI

struct LoginView: View {
    
    //: MARK: - Properties
    @ObservedObject var viewModel = LoginViewModel()
    
    @AppStorage("isSendingHome") var isSendingHome: Bool = false
    
    @AppStorage("userAddress") var userAddress: String = ""
    
    var body: some View {
        MotionAnimationView()
            .ignoresSafeArea()
            .overlay(
                VStack {
                    HStack {
                        Image(systemName: "square.grid.3x3")
                            .font(.title)
                            .foregroundColor(.black)
                        
                        Text("Tillies")
                            .foregroundColor(.black)
                            .font(.title)
                            .fontWeight(.black)
                        
                        Image(systemName: "square.grid.3x3")
                            .font(.title)
                            .foregroundColor(.black)
                    }//: HStack
                    
                    authenticate()
                        .padding(.top)
                    
                }//: Outer VStack
                .padding(50)
                .background(
                    Color.green
                        .cornerRadius(15)
                )
            )
    }
    
    private func authenticate() -> some View {
        return Section {
            Button("Log in with Blocto") {
                viewModel.authn(provider: .blocto)
            }
            if viewModel.isLoading {
                ProgressView()
            } else {
                Text(verbatim: viewModel.address)
                Button {
                    userAddress = viewModel.address
                    isSendingHome = true
                } label: {
                    Text("Continue")
                }

            }
        }
    }
    
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
