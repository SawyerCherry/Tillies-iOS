//
//  ProfileView.swift
//  Tillies
//
//  Created by Sawyer Cherry on 1/19/22.
//

import SwiftUI
import FCLAuthSwift

struct ProfileView: View {
    // TODO: build VM that fetches NFTs given the current user's address

    @ObservedObject var viewModel = ProfileViewModel()

    @AppStorage("userAddress") var userAddress: String!
    
    var body: some View {
        NavigationView {
            ScrollView {
                HStack {
                    VStack(spacing: 10) {
                        Text("Wallet Address")
                            .font(.title2)
                            .fontWeight(.semibold)
                        Text(userAddress)
                            .fontWeight(.light)
                    }
                    
                    .padding()
                    .background(
                        Color.green
                            .cornerRadius(10)
                    )
                    
                    VStack {
                        Text("NFT's owned")
                            .font(.title2)
                            .fontWeight(.semibold)
                            
                        Text("36")
                            .font(.title)
                            .fontWeight(.light)
                    }
                    .padding()
                    .background(
                        Color.green
                            .cornerRadius(10)
                    )
                    
                }//: Stack
                
                HStack {
                    Text("My NFT's")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.horizontal, 20)
                    Spacer()
                }
                TabView {
                    ForEach(viewModel.nfts) { ntf in
                        NFTCardView(model: ntf)
                    }
                }
                .tabViewStyle(.page)
                .frame(height: 300)
                
                    
                    
                
                
                
                
            }.navigationTitle("Sawyer Cherry")
                .background(MotionAnimationView().ignoresSafeArea())
        }
        
        .onAppear {
            
            flow.configure(chainID: .testnet)
            
            let address = Flow.Address(hex: "0x77843dcd06310709")
            flow.accessAPI.getAccountAtLatestBlock(address: address).whenComplete { result in
                print(self)
                switch result {
                case let .success(account):
                    // Handle Success Result
                    print(account)
                    let contacts: [(string: String, hex: String)] = account!.contracts.map { contract in
                        let s = String(data: contract.value.data, encoding: .utf8)!
                        let h = contract.value.hex
                        
                        return (string: s, hex: h)
                    }
//                    print(contacts)
//                    print("Don")
                    
                    // Example
                    // Hex: 2f2f204e4f54453a2049206465706c6f796564207468697320746f203078303220696e2074686520706c617967726f756e640a696d706f7274204e6f6e46756e6769626c65546f6b656e2066726f6d203078363331653838616537663164376332300a0a70756220636f6e7472616374204d794e46543a204e6f6e46756e6769626c65546f6b656e207b0a0a20207075622076617220746f74616c537570706c793a2055496e7436340a0a2020707562206576656e7420436f6e7472616374496e697469616c697a656428290a2020707562206576656e742057697468647261772869643a2055496e7436342c2066726f6d3a20416464726573733f290a2020707562206576656e74204465706f7369742869643a2055496e7436342c20746f3a20416464726573733f290a0a2020707562207265736f75726365204e46543a204e6f6e46756e6769626c65546f6b656e2e494e4654207b0a20202020707562206c65742069643a2055496e743634200a20202020707562206c65742069706673486173683a20537472696e670a2020202070756220766172206d657461646174613a207b537472696e673a20537472696e677d0a0a20202020696e6974285f69706673486173683a20537472696e672c205f6d657461646174613a207b537472696e673a20537472696e677d29207b0a20202020202073656c662e6964203d204d794e46542e746f74616c537570706c790a2020202020204d794e46542e746f74616c537570706c79203d204d794e46542e746f74616c537570706c79202b20310a0a20202020202073656c662e6970667348617368203d205f69706673486173680a20202020202073656c662e6d65746164617461203d205f6d657461646174610a202020207d0a20207d0a0a2020707562207265736f7572636520696e7465726661636520436f6c6c656374696f6e5075626c6963207b0a202020207075622066756e20626f72726f77456e746972654e46542869643a2055496e743634293a20264d794e46542e4e46540a20207d0a0a2020707562207265736f7572636520436f6c6c656374696f6e3a204e6f6e46756e6769626c65546f6b656e2e52656365697665722c204e6f6e46756e6769626c65546f6b656e2e50726f76696465722c204e6f6e46756e6769626c65546f6b656e2e436f6c6c656374696f6e5075626c69632c20436f6c6c656374696f6e5075626c6963207b0a202020202f2f20746865206964206f6620746865204e4654202d2d3e20746865204e4654207769746820746861742069640a2020202070756220766172206f776e65644e4654733a20407b55496e7436343a204e6f6e46756e6769626c65546f6b656e2e4e46547d0a0a202020207075622066756e206465706f73697428746f6b656e3a20404e6f6e46756e6769626c65546f6b656e2e4e465429207b0a2020202020206c6574206d79546f6b656e203c2d20746f6b656e2061732120404d794e46542e4e46540a202020202020656d6974204465706f7369742869643a206d79546f6b656e2e69642c20746f3a2073656c662e6f776e65723f2e61646472657373290a20202020202073656c662e6f776e65644e4654735b6d79546f6b656e2e69645d203c2d21206d79546f6b656e0a202020207d0a0a202020207075622066756e20776974686472617728776974686472617749443a2055496e743634293a20404e6f6e46756e6769626c65546f6b656e2e4e4654207b0a2020202020206c657420746f6b656e203c2d2073656c662e6f776e65644e4654732e72656d6f7665286b65793a207769746864726177494429203f3f2070616e6963282254686973204e465420646f6573206e6f7420657869737422290a202020202020656d69742057697468647261772869643a20746f6b656e2e69642c2066726f6d3a2073656c662e6f776e65723f2e61646472657373290a20202020202072657475726e203c2d20746f6b656e0a202020207d0a0a202020207075622066756e2067657449447328293a205b55496e7436345d207b0a20202020202072657475726e2073656c662e6f776e65644e4654732e6b6579730a202020207d0a0a202020207075622066756e20626f72726f774e46542869643a2055496e743634293a20264e6f6e46756e6769626c65546f6b656e2e4e4654207b0a20202020202072657475726e202673656c662e6f776e65644e4654735b69645d20617320264e6f6e46756e6769626c65546f6b656e2e4e46540a202020207d0a0a202020207075622066756e20626f72726f77456e746972654e46542869643a2055496e743634293a20264d794e46542e4e4654207b0a2020202020206c6574207265666572656e6365203d202673656c662e6f776e65644e4654735b69645d206173206175746820264e6f6e46756e6769626c65546f6b656e2e4e46540a20202020202072657475726e207265666572656e63652061732120264d794e46542e4e46540a202020207d0a0a20202020696e69742829207b0a20202020202073656c662e6f776e65644e465473203c2d207b7d0a202020207d0a0a2020202064657374726f792829207b0a20202020202064657374726f792073656c662e6f776e65644e4654730a202020207d0a20207d0a0a20207075622066756e20637265617465456d707479436f6c6c656374696f6e28293a2040436f6c6c656374696f6e207b0a2020202072657475726e203c2d2063726561746520436f6c6c656374696f6e28290a20207d0a0a20207075622066756e20637265617465546f6b656e2869706673486173683a20537472696e672c206d657461646174613a207b537472696e673a20537472696e677d293a20404d794e46542e4e4654207b0a2020202072657475726e203c2d20637265617465204e4654285f69706673486173683a2069706673486173682c205f6d657461646174613a206d65746164617461290a20207d0a0a2020696e69742829207b0a2020202073656c662e746f74616c537570706c79203d20300a20207d0a7d
                    
                    let firstContractHex = contacts[0].hex
                    let id = Flow.ID(hex: firstContractHex)
                    
                    let cadencScript = """
                    
                    """
                    let script = Flow.Script(text: cadencScript)
                    flow.accessAPI.executeScriptAtBlockId(script: script, blockId: id, arguments: []) { result in
                        switch result {
                        case .success(let response):
//                            JSONDecoder().decode(NFTFromCadence.self, from: response.data)
                            break
                        case .failure(let error):
                            fatalError(error.localizedDescription)
                        }
                    }
                    
//                    flow.accessAPI.sendTransaction(transaction: Flow.Transaction(script: <#T##Flow.Script#>, arguments: <#T##[Flow.Argument]#>, referenceBlockId: <#T##Flow.ID#>, gasLimit: <#T##BigUInt#>, proposalKey: <#T##Flow.TransactionProposalKey#>, payerAddress: <#T##Flow.Address#>, authorizers: <#T##[Flow.Address]#>))
                    
//                    flow.accessAPI.getid(id: id) { result in
//                        switch result {
//                        case .success(let block):
//                            print(block)
//                        case .failure(let error):
//                            print(error)
//                        }
//                    }
                    
                    
//                    let hex = account!.contracts.first!.value.
//                    flow.accessAPI.getLatestBlock(sealed: true) { result in
//                        switch result {
//                        case .success(let block):
//                            print(block)
//                        case .failure(let error):
//                            print(error)
//                        }
//                    }
//                    flow.accessAPI.id
                case let .failure(error):
                    // Handle Error
                    let e = error as! GRPC.GRPCStatus
                    print(e)
                }
            }
        }
    }
}

import Flow
import GRPC

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}