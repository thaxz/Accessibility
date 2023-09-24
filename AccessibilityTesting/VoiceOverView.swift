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
                        Text(isActive ? "ON" : "OFF")
                    }
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
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
                    Text("Favorites")
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
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8){
                            ForEach(0..<10){ index in
                                Image("taylorImage")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(10)
                                Text("Item \(index)")
                            }
                            .onTapGesture {
                                
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
