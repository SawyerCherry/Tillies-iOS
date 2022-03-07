//
//  NFTModel.swift
//  Tillies
//
//  Created by Sawyer Cherry on 3/6/22.
//

import Foundation


struct NFTModel: Hashable, Identifiable {
    let id: String
    let price: Int
    let title: String
    let description: String
}
