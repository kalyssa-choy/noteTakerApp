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
        NavigationView{
            VStack{
                Text(theNote.title)
                    .fontWeight(.bold)
                    .font(.system(size: 33))
                    .frame(maxWidth: 360, alignment: .topLeading)
                
                VStack{
                    Text(theNote.body)
                        .padding()
                        .frame(maxWidth: .infinity, minHeight: 600, alignment: .topLeading)
                        .background(Color(.systemGray6))
                        .cornerRadius(20)
                }
                .frame(maxWidth: 350)
                
                Spacer()
            }
            .padding(.top, -20)
            
        }
        
    }
}

#Preview {
    DetailNoteView(theNote: Note(title:"temp", body: "temp"))
}
