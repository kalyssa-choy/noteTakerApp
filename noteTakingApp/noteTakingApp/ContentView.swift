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
    //the array carrying all the notes
    @State private var notes: [Note] = []
    
    var body: some View {
        //for navigation between pages
        NavigationView{
            VStack {
                //checks if there are no notes
                if notes.count == 0{
                    Text("Notes Is Empty")
                        //styling
                        .padding(60)
                }
                else{
                    //lists all of the notes
                    List {
                        //traverses through notes array to display each note
                        ForEach(notes.indices, id: \.self) { index in
                            //formatting
                            Section {
                                //link to the specific note
                                NavigationLink(destination: DetailNoteView(theNote: notes[index])) {
                                    //the displayed text of the link
                                    VStack(alignment: .leading, spacing: 8) {
                                        //title
                                        Text(notes[index].title)
                                            //styling
                                            .bold()
                                        //body
                                        Text(notes[index].body)
                                    }
                                    //styling
                                    .font(.system(size: 20))
                                    
                                }
                                //styling
                                .frame(width: 300, height: 100)
                            }
                        }
                    }
                }
                
                //going to the page for creating new note
                NavigationLink(destination: NewNoteView(notes: $notes), label: {
                    //the text of the button
                    Text("New Note")
                        //styling
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        
                })
                //formatting
                Spacer()
            }
            //title of the page
            .navigationBarTitle("Notes")
        }
    }
}

#Preview {
    ContentView()
}
