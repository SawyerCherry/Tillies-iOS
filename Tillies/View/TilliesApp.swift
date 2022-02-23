//
//  TilliesApp.swift
//  Tillies
//
//  Created by Sawyer Cherry on 1/18/22.
//

import SwiftUI
import Flow
@main
struct TilliesApp: App {
    

    @AppStorage("isSendingHome") var isSendingHome: Bool = false
    
   
    
    var body: some Scene {
        WindowGroup {
            if isSendingHome == false {
                LoginView()
            } else {
                TabView {
                    ProfileView()
                        .tabItem {
                            Image(systemName: "person")
                                .tint(Color.green)
                            Text("Profile")
                                .foregroundColor(Color(UIColor.systemGreen))
                        }
                    ExploreView()
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(Color(UIColor.systemGreen))
                            Text("Explore")
                                .foregroundColor(Color(UIColor.systemGreen))
                        }
                    NFTCardView(model: NFTModel())
                        .tabItem {
                            Image(systemName: "doc.text")
                                .foregroundColor(Color(UIColor.systemGreen))
                            Text("View")
                                .foregroundColor(Color(UIColor.systemGreen))
                        }
                }
                
            }
        }
    }
}

// understand the demo
// - VM helps configure and login. It also fetches and update the UI
//COMPLETED

// intergrate the demo into this app
// - build a VM that can: configure fcl with blocko, present the web UI to login the user, store the address in UserDefaults
//COMPLETED

// Build the home screen + profile screen
// - after logging in, transition the user to the home screen : TRANSITIONED, BUT NO address is there. 
// IN PROGRESS

// try to fetch user's NFTs using  the wrapper SDK
// - configure fcl in the App startup

// try to fetch all NFTs using Flow SDK (not the wrapper SDK)
