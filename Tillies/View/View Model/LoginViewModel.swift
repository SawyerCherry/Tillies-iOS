//
//  LoginViewModel.swift
//  Tillies
//
//  Created by Sawyer Cherry on 1/27/22.
//

import AVKit
import FCLAuthSwift
import Foundation
import UIKit

class LoginViewModel: ObservableObject {
    
    //: MARK: - Properties
    
    @Published var address: String = ""
    @Published var isLoading: Bool = false
    
    init() {
        fcl.delegate = self

        fcl.config(
            appInfo: FCLAppInfo(
                title: "FCL iOS Demo",
                icon: URL(string: "https://foo.com/bar.png")!,
                location: URL(string: "https://foo.com")!
            ),
            // default provider is  [.dapper, .blocto]
            providers: [.blocto]
        )
    }
    
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


extension LoginViewModel: FCLAuthDelegate {
    func showLoading() {
        isLoading = true
    }

    func hideLoading() {
        isLoading = false
    }
}
