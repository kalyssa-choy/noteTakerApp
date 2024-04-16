//
//  DetailNoteView.swift
//  noteTakingApp
//
//  Created by StudentAM on 3/27/24.
//

import SwiftUI

struct DetailNoteView: View {
    @State var theNote: Note
    
    var body: some View {
        //allows for navigating between pages
        NavigationView{
            VStack{
                //the note's title
                Text(theNote.title)
                    //styling
                    .fontWeight(.bold)
                    .font(.system(size: 33))
                    .frame(maxWidth: 360, alignment: .topLeading)
                
                //for formatting
                VStack{
                    //the note body
                    Text(theNote.body)
                        //styling
                        .padding()
                        .frame(maxWidth: .infinity, minHeight: 600, alignment: .topLeading)
                        .background(Color(.systemGray6))
                        .cornerRadius(20)
                }
                //styling
                .frame(maxWidth: 350)
                
                //formatting
                Spacer()
            }
            //styling
            .padding(.top, -20)
            
        }
        
    }
}

#Preview {
    DetailNoteView(theNote: Note(title:"temp", body: "temp"))
}
