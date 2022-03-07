//
//  TilliesApp.swift
//  Tillies
//
//  Created by Sawyer Cherry on 1/18/22.
//

import SwiftUI
import Flow
@main
struct TilliesApp: SwiftUI.App {
    

    @AppStorage("isSendingHome") var isSendingHome: Bool = false
    
   
    
    var body: some Scene {
        WindowGroup {
            if isSendingHome == false {
                LoginView()
                    .onAppear {
                        dosomJazz()
                    }
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
//                    NFTCardView(model: NFTModel(id: "lala", price: 1))
//                        .tabItem {
//                            Image(systemName: "doc.text")
//                                .foregroundColor(Color(UIColor.systemGreen))
//                            Text("View")
//                                .foregroundColor(Color(UIColor.systemGreen))
//                        }
                }
                
            }
        }
    }
}

import Realm
import RealmSwift

class RealmStore {
    init() {
        
    }
    
    class func getRealm() -> Realm {
        let app = App(id: "application-2-pjkex")
        dosomJazz()
        let config = app.currentUser!.configuration(partitionValue: "tillies")
        let realm = try! Realm(configuration: config)
        return realm
    }
}

func dosomJazz() {
    Task {
        
        let app = App(id: "application-2-pjkex")
        
        do {
            let user = try await app.login(credentials: .anonymous)
            let config = user.configuration(partitionValue: "tillies")
            let _ = try await Realm(configuration: config)
        } catch {
            print(error)
        }
        
        
    }
}

//Histogram(["foo", "foo", "bar"])
//foo = 2
//bar = 1
//    .add("foo")
//    .remove("foo")
//    .count(for: "foo") => 2


//{
//  "title": "nft",
//  "properties": {
//    "__v": {
//      "bsonType": "int"
//    },
//    "_id": {
//      "bsonType": "objectId"
//    },
//    "description": {
//      "bsonType": "string"
//    },
//    "file": {
//      "bsonType": "string"
//    },
//    "id": {
//      "bsonType": "int"
//    },
//    "partition": {
//      "bsonType": "string"
//    },
//    "price": {
//      "bsonType": "int"
//    },
//    "title": {
//      "bsonType": "string"
//    }
//  },
//  "required": [
//    "partition"
//  ]
//}
class nft: Object {
//    override class func className() -> String {
//        "nft"
//    }
    
    @Persisted(primaryKey: true) var _id: ObjectId?
    @Persisted var notes: String? // aka description
    @Persisted var file: String?
    @Persisted var price: Int?
    @Persisted var partition: String
    @Persisted var title: String?
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
