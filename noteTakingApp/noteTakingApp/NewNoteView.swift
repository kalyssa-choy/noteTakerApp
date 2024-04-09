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
    @State private var showAlert: Bool = false
    @Binding var notes: [Note]
    @Environment(\.presentationMode) var presentationMode
    
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
                    //checking that there is text in the title and the body
                    if text != "" && title != ""{
                        let newNote: Note = Note(title: title, body: text)
                        notes.append(newNote)
                    }
           
                    showAlert = true
                    
                }, label: {
                    Text("Add Note")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                })
                
                .alert(isPresented:$showAlert) {
                    if text != "" && title != "" {
                        return Alert(
                            title: Text("Note has been added"),
                            dismissButton: .default(Text("Return")) {
                                self.presentationMode.wrappedValue.dismiss()
                            }
                        )
                    }
                    else {
                        return Alert(
                            title: Text("Could not add note"),
                            message: Text("Must add a title or text to the body"),
                            dismissButton: .default(Text("Okay"))
                        )
                    }
                }
                
                Spacer()
            }
            .padding(.top, -20)
        }
    }
}

#Preview {
    NewNoteView(notes: .constant([]))
}
