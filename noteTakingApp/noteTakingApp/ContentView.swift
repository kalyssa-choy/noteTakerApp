//
//  ContentView.swift
//  noteTakingApp
//
//  Created by StudentAM on 3/25/24.
//

import SwiftUI

struct Note {
    var title: String
    var body: String

}

struct ContentView: View {
    @State private var notes: [Note] = []
    
    var body: some View {
        NavigationView{
            VStack {
                if notes.count == 0{
                    Text("Notes Is Empty")
                        .padding(60)
                }
                else{
                    List {
                        ForEach(notes.indices, id: \.self) { index in
                            Section {
                                NavigationLink(destination: DetailNoteView(theNote: notes[index])) {
                                    VStack(alignment: .leading, spacing: 8) {
                                        Text(notes[index].title)
                                            .bold()
                                        Text(notes[index].body)
                                    }
                                    .font(.system(size: 20))
                                    
                                }
                                .frame(width: 300, height: 100)
                            }
                        }
                    }
                }
                
                NavigationLink(destination: NewNoteView(notes: $notes), label: {
                    Text("New Note")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        
                })
                Spacer()
            }
            .navigationBarTitle("Notes")
        }
    }
}

#Preview {
    ContentView()
}
