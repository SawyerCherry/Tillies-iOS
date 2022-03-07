//
//  ContentView.swift
//  Tillies
//
//  Created by Sawyer Cherry on 1/18/22.
//

import Combine
import SwiftUI
import RealmSwift



class ExploreViewModel: ObservableObject {
    @Published var nfts = [NFTModel]()
    
    private var resultWillChange: AnyCancellable?
    
    init() {
        let realm = RealmStore.getRealm()
        
        let result = realm.objects(nft.self)
        updateNFTS(result)
        
        resultWillChange = result.objectWillChange.sink { _ in
            self.updateNFTS(result)
        }
    }
    
    private func updateNFTS(_ result: Results<nft>) {
        self.nfts = result.map { nftObject in
            return NFTModel(
                id: nftObject._id?.stringValue ?? "",
                price: nftObject.price ?? 0,
                title: nftObject.title ?? "",
                description: nftObject.notes ?? ""
            )
        }
    }
}

struct ExploreView: View {
    @ObservedObject var viewModel = ExploreViewModel()
  
  var body: some View {
      List(viewModel.nfts) { nft in
          Text(String(nft.id))
          Text(String(nft.price))
          Text(nft.title)
          Text(nft.description)
//          NFTCardView(model: nft)
      }
  }
      
}

struct ExploreView_Previews: PreviewProvider {
  static var previews: some View {
      ExploreView()
      .previewDevice("iPhone 12 Pro")
  }
}

