//
//  ContentView.swift
//  swift-project
//
//  Created by admin on 22/6/2567 BE.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \TripItem.startDate) private var trips: [TripItem]
    @State var showAddTripSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.red
                    .opacity(0.5)
                    .ignoresSafeArea()
                List {
                    ForEach(trips) { item in
                        NavigationLink {
                            TripInfoView(item: item)
                        } label: {
                            TripRowItem(item: item)
                        }
                    }.onDelete{ indexSet in
                        for index in indexSet {
                            context.delete(trips[index])
                            try! context.save()
                        }
                    }
                }
                .padding()
                .listStyle(.plain)
                .navigationTitle("✈️ My Trips")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Add Trip") {
                            showAddTripSheet.toggle()
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.white)
                        .foregroundColor(.black)
                    }
                }
                .sheet(isPresented: $showAddTripSheet, content: {
                    AddTripSheet()
                        .presentationDetents([.medium, .large])
                        .presentationDragIndicator(.visible)
                })
            }
        }
    }
}

//#Preview {
//    ContentView()
//}
