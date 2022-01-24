//
//  NFTCardView.swift
//  Tillies
//
//  Created by Sawyer Cherry on 1/18/22.
//

import SwiftUI

struct NFTCardView: View {
    var body: some View {
        VStack {
            VStack {
                Image("dogeneo")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .zIndex(1)
                    .shadow(color: .black, radius: 20, x: 0, y: 0)
                    .padding()
                
                HStack {
                    Text("Neoge")
                        .foregroundColor(Color.black)
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .multilineTextAlignment(.center)
                        .padding()
                        .background(
                            Color.black
                                .opacity(0.4)
                                .cornerRadius(10)
                        )
                    
                    Spacer()
                    
                    Text("Price: $890")
                        .foregroundColor(Color.black)
                        .font(.title3)
                        .fontWeight(.black)
                        .padding()
                        .background(
                            Color.black
                                .opacity(0.4)
                                .cornerRadius(10)
                        )
                }//: Stack
                .padding(.horizontal)
                VStack {
                    Text("Author")
                        .font(.title3)
                        .fontWeight(.black)
                        .foregroundColor(.black)
                        
                    Text("SawyerTheCherry")
                        .foregroundColor(.black)
                        .font(.title2)
                        .fontWeight(.black)
                }
                .padding()
                .background(
                    Color.black
                        .opacity(0.4)
                        .cornerRadius(10)
                )
                .padding()
                .multilineTextAlignment(.center)
    
                 
                ScrollView {
                    HStack {
                        Text("Description:")
                            .foregroundColor(Color.black)
                            .font(.title3)
                            .fontWeight(.black)
                            .padding(.horizontal)
                            .padding(.top)
                            Spacer()
                        
                    }
                    Text("""
                         Uh, summa-lumma, dooma-lumma, you assumin Im a human
                         What I gotta do to get it through to you Im superhuman?
                         Innovative and Im made of rubber
                         So that anything you say is ricochetin off of me
                         And itll glue to you and
                         Im devastating, more than ever demonstrating
                         How to give a motherfuckin audience
                         A feeling like its levitating
                         Never fading, and I know the haters are forever waiting
                         For the day that they can say I fell off, they'll be celebrating
                         'Cause I know the way to get em motivated I make elevating music, you make elevator music Oh, he's too mainstream. Well, thats what they do when they get jealous They confuse it It's not hip-hop, it's pop, —cause I found a hella way to fuse it
                    """)
                        .padding(.horizontal)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                }
                
                .background(
                    Color.black
                        .opacity(0.4)
                        .cornerRadius(10)
                )
                .frame(height: 70)
                
            }.padding()
        }
        .background(
            Color.green
                .overlay(MotionAnimationView())
        )
        .cornerRadius(10)
        .padding()
    }
}

struct NFTCardView_Previews: PreviewProvider {
    static var previews: some View {
        NFTCardView()
            .preferredColorScheme(.dark)
    }
}
