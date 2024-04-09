//
//  NewNoteView.swift
//  noteTakingApp
//
//  Created by StudentAM on 3/25/24.
//

import SwiftUI

struct NewNoteView: View {
    @State private var text: String = ""
    @State private var title: String = ""
    @Binding var notes: [Note]
    
    var body: some View {
        NavigationView{
            VStack{
                Text("New Note")
                    .fontWeight(.bold)
                    .font(.system(size: 33))
                    .frame(maxWidth: 360, alignment: .topLeading)
                
                TextField("Title", text: $title)
                    .padding()
                    .frame(width: 350, height: 50)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                
                TextEditor(text: $text)
                    .padding()
                    .background(Color(.systemGray6))
                    .frame(maxWidth: 350, minHeight: 450)
                    .cornerRadius(15)
                    
                
                Spacer()
                
                Button(action: {
                    var newNote: Note = Note(title: title, body: text)
                    notes.append(newNote)
                    
                }, label: {
                    Text("Add Note")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                })
                
                Spacer()
            }
            .padding(.top, -20)
        }
    }
}

#Preview {
    NewNoteView(notes: .constant([]))
}
