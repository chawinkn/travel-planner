//
//  TripRowItem.swift
//  swift-project
//
//  Created by admin on 22/6/2567 BE.
//

import SwiftUI

struct TripRowItem: View {
    var item: TripItem
    @Environment(\.modelContext) var context
    
    var body: some View {
        HStack() {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.blue)
                        .onTapGesture {
                            item.isCompleted.toggle()
                            try? context.save()
                        }
                    Text(item.name)
                        .font(.title)
                    Spacer()
                    Text(item.isCompleted ? "ไปแล้ว" : "ยังไม่ไป")
                        .font(.subheadline)
                        .padding()
                        .background(item.isCompleted ? .green : .yellow)
                        .cornerRadius(5)
                }
                HStack {
                    Text(item.startDate, style: .date)
                        .font(.caption)
                    Text("-")
                        .font(.caption)
                    Text(item.endDate, style: .date)
                        .font(.caption)
                }
            }
        }
    }
}

//#Preview {
//    TripRowItem()
//}
