//
//  VoiceOverView.swift
//  AccessibilityTesting
//
//  Created by thaxz on 24/09/23.
//

import SwiftUI

struct VoiceOverView: View {
    
    @State private var isActive: Bool = false
    
    var body: some View {
        NavigationStack{
            Form{
                Section {
                    Toggle("Volume", isOn: $isActive)
                    HStack{
                        Text("Volume")
                        Spacer()
                        // Since its a custom "toggle", its not gruped by default, leading to confuse voiceover
                        Text(isActive ? "ON" : "OFF")
                            .accessibilityHidden(true)
                    }
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        isActive.toggle()
                    }
                    //to be read as a group by voiceover
                    .accessibilityElement(children: .combine)
                    // reading as a button
                    .accessibilityAddTraits(.isButton)
                    // voiceover is gonna read this
                    .accessibilityValue(isActive ? "is on" : "is off")
                    .accessibilityHint("Double tap to toggle setting.")
                    .accessibilityAction {
                        isActive.toggle()
                    }
                    
                } header: {
                    Text("Preferences".uppercased())
                }
                Section {
                    Button("Favorites") {
                        
                    }
                    Button {
                        
                    } label: {
                        Image(systemName: "heart.fill")
                    }
                    .accessibilityLabel("Favorites")
                    Text("Favorites")
                        .accessibilityAddTraits(.isButton)
                        .onTapGesture {
                            
                        }
                } header: {
                    Text("Application".uppercased())
                }
                VStack{
                    Text("CONTENT")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.secondary)
                        .font(.caption)
                        .accessibilityAddTraits(.isHeader)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8){
                            ForEach(0..<10){ index in
                                VStack{
                                    Image("taylorImage")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 100, height: 100)
                                        .cornerRadius(10)
                                    Text("Item \(index)")
                                }
                                .onTapGesture {
                                    
                                }
                                .accessibilityElement(children: .combine)
                                .accessibilityLabel("Item \(index) is a image of Taylor Swift")
                                .accessibilityAddTraits(.isButton)
                                .accessibilityHint("Double tap to open")
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("Settings")
    }
}

struct VoiceOverView_Previews: PreviewProvider {
    static var previews: some View {
        VoiceOverView()
    }
}
