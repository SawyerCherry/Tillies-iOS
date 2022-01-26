//
//  FlowBlockchain.swift
//  Tillies
//
//  Created by Sawyer Cherry on 1/24/22.
//

import Foundation
import Flow

func setup() {
    let endpoint = Flow.ChainID.Endpoint(node: "flow-testnet.g.alchemy.com", port: 443)
    let chainID = Flow.ChainID.custom(name: "Alchemy-Testnet", endpoint:endpoint)
    flow.configure(chainID: chainID)
}
