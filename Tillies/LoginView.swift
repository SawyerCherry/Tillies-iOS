//
//  LoginView.swift
//  Tillies
//
//  Created by Sawyer Cherry on 1/24/22.
//

import SwiftUI

struct LoginView: View {
    @State private var passwordText: String = ""
    @State private var emailText: String = ""
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
                    
                    
                    
                    VStack(spacing: 20) {
                        TextField("Email", text: $emailText)
                            .padding(2)
                            .border(.black)
                            .cornerRadius(5)
                            .fixedSize()
                        
                        SecureField("Password", text: $passwordText)
                            .padding(2)
                            .border(.black)
                            .cornerRadius(5)
                            .fixedSize()
                    }//: VStack
                    
                    
                }
                    .padding(50)
                    .background(
                        Color.green
                            
                            .cornerRadius(15)
                    )
            )
    }
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
