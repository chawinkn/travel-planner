//
//  AddNoteSheet.swift
//  swift-project
//
//  Created by admin on 23/6/2567 BE.
//

import SwiftUI

struct AddNoteSheet: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
//    @State var newNote = Note(topic: "", content: "")
    var item: TripItem
    @State var content: String = ""
    
    var body: some View {
        NavigationStack {
            List {
//                TextField("Topic", text: $newNote.topic)
                TextField("Content", text: $content, axis: .vertical)
                    .frame(height: 400)
            }
            .navigationTitle("Add Note")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancle") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add") {
                        item.content = content
                        try! context.save()
                        dismiss()
                    }
                }
            }
        }
    }
}

//#Preview {
//    AddNoteSheet()
//}
