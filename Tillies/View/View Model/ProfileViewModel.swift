//
//  ProfileViewModel.swift
//  Tillies
//
//  Created by Sawyer Cherry on 1/31/22.
//

import AVKit
import FCLAuthSwift
import Foundation
import UIKit
import Flow
import CryptoKit


class ProfileViewModel: ObservableObject {
    
    @Published var address: String = ""
    
    func authn(provider: FCLProvider) {
        // Default provider is dapper
        address = ""
        fcl.authenticate(provider: provider) { result in
            DispatchQueue.main.async {
                switch result {
                case let .success(data):
                    self.address = data.address
                case let .failure(error):
                    self.address = error.localizedDescription
                }
            }
        }
    }
}
