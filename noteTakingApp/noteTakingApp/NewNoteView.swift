//
//  NewNoteView.swift
//  noteTakingApp
//
//  Created by StudentAM on 3/25/24.
//

import SwiftUI

struct NewNoteView: View {
    //the body of the note
    @State private var text: String = ""
    
    //the title of the note
    @State private var title: String = ""
    
    //checks if an alert should be displayed
    @State private var showAlert: Bool = false
    
    //the array holding all of the user's notes
    @Binding var notes: [Note]
    
    //for going back out of a navigation path
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        //navigation view to go between links
        NavigationView{
            VStack{
                //the page label
                Text("New Note")
                    //styling
                    .fontWeight(.bold)
                    .font(.system(size: 33))
                    .frame(maxWidth: 360, alignment: .topLeading)
                
                //allows the user to enter a title for their note
                TextField("Title", text: $title)
                    //styling
                    .padding()
                    .frame(width: 350, height: 50)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                
                //allows the user to add text to the body of their note
                TextEditor(text: $text)
                    //styling
                    .padding()
                    .background(Color(.systemGray6))
                    .frame(maxWidth: 350, minHeight: 450)
                    .cornerRadius(15)
                    
                //for formatting
                Spacer()
                
                //button for adding a new note
                Button(action: {
                    //checking that there is text in the title and the body
                    if text != "" && title != ""{
                        //creates a new note
                        let newNote: Note = Note(title: title, body: text)
                        //appends that new note
                        notes.append(newNote)
                    }
                    
                    //updates the showAlert boolean since note has been added
                    showAlert = true
                    
                }, label: {
                    //text of the button "Add Note"
                    Text("Add Note")
                        //styling
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                })
                
                //checks if alerts should be shown
                .alert(isPresented:$showAlert) {
                    //checks the qualities to see what type of alert to display
                    if text != "" && title != "" {
                        //note has been added alert
                        return Alert(
                            //the text of the alert
                            title: Text("Note has been added"),
                            dismissButton:
                                //directs the user back to the home page
                                .default(Text("Return")) {
                                self.presentationMode.wrappedValue.dismiss()
                            }
                        )
                    }
                    else {
                        //alert for if note couldn't be added
                        return Alert(
                            //text of the alert
                            title: Text("Could not add note"),
                            message: Text("Must add a title or text to the body"),
                            //allows user to dismiss the alert
                            dismissButton: .default(Text("Okay"))
                        )
                    }
                }
                
                //formatting
                Spacer()
            }
            //styling
            .padding(.top, -20)
        }
    }
}

#Preview {
    NewNoteView(notes: .constant([]))
}
