//
//  ContentView.swift
//  IAMRICH
//
//  Created by Бакдаулет on 27.09.2024.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
            VStack {
                Spacer()
                
                Image("diamond")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 500)
                    .shadow(radius: 10)
                
                Text("I Am Rich")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                    .padding(.top, 20)
                
                Spacer()
            }
//            .background(Color.black.edgesIgnoringSafeArea(.all))
        }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
