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
    
    @Published var nfts = [
        NFTModel(),
        NFTModel(),
        NFTModel()
        
    ]
    
    func authn(provider: FCLProvider) {
        // Default provider is dapper
        address = ""
        fcl.authenticate(provider: provider) { result in
            DispatchQueue.main.async {
                switch result {
                case let .success(data):
                    self.address = data.address
                    self.fetchNFTS()
                case let .failure(error):
                    self.address = error.localizedDescription
                }
            }
        }
    }
    
    private func fetchNFTS() {
        // fetch via blockchain
        
//        Ask brian if he knows what GetBlockByID or Transaction or collection mean
//        do you have to execute a script just like in the React codebase?
//        do i send a trasaction to get NFTs?
//        google 'how to deserialize flow results to swift models"
        
        
        // map fetched data into my data model; NFTModel(....)
        // update self.nfts property
        
        
        fcl.query {
            
            
//            const getUserNFTs = async () => {
//                const result = await fcl
//                  .send([
//                    fcl.script(getNFTsScript),
//                    fcl.args([fcl.arg(props.address, t.Address)]),
//                  ])
//                  .then(fcl.decode);
//
//                console.log(result);
//                setNFTs(result);
//              };
//
//              const addUser = async () => {
//
//              }
            cadence {
                """
                    pub fun main(account: Address): [&MyNFT.NFT] {
                      let collection = getAccount(account).getCapability(/public/TestCollection)
                                        .borrow<&MyNFT.Collection{NonFungibleToken.CollectionPublic, MyNFT.CollectionPublic}>()
                                        ?? panic("Can't get the User's collection.")
                      let returnVals: [&MyNFT.NFT] = []
                      let ids = collection.getIDs()
                      for id in ids {
                        returnVals.append(collection.borrowEntireNFT(id: id))
                      }
                      return returnVals
                    }
                """
            }
            
            arguments {
                [.address(Flow.Address(hex: address))]
            }
           
        }
        
        
        
    }
    
    private func grabNFT() {
        print("ughhhh")
    }
}
