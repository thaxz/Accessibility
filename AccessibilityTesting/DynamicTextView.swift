//
//  ContentView.swift
//  AccessibilityTesting
//
//  Created by thaxz on 24/09/23.
//

import SwiftUI

struct DynamicTextView: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<10){ _ in
                    VStack(alignment: .leading, spacing: 20){
                        HStack{
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.blue)
                            Text("This is a simple text")
                                .font(.title)
                        }
                        Text("And this is a longer text that can expand to multiple lines :)")
                            .font(.subheadline)
                    }
                }
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DynamicTextView()
    }
}
