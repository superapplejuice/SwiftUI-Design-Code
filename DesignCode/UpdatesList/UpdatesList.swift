//
//  UpdatesList.swift
//  DesignCode
//
//  Created by Jan Mathew on 14/5/20.
//  Copyright © 2020 Jan Mathew. All rights reserved.
//

import SwiftUI

struct UpdatesList: View {
    @ObservedObject var updateStore = UpdateStore()

    func addUpdate() {
        updateStore.updateList.append(
            UpdateData(
                icon: "Card1",
                title: "New item",
                content: "This is a new item!",
                date: "JAN 31"
            )
        )
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(updateStore.updateList) { item in
                    // destination sets the View to render
                    NavigationLink(destination: UpdateDetail(updateItem: item)) {
                        HStack {
                            Image(item.icon)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                                .background(Color.black)
                                .cornerRadius(20)
                                .padding(.trailing, 8)

                            // `spacing` adds padding for each element
                            VStack(alignment: .leading, spacing: 8) {
                                Text(item.title)
                                    .font(.system(size: 20, weight: .bold))

                                Text(item.content)
                                    .lineLimit(2)
                                    .font(.subheadline)
                                    .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))

                                Text(item.date)
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.vertical, 8)
                    }
                }
                .onDelete { index in
                    self.updateStore.updateList.remove(at: index.first ?? 0)
                }
                // `onMove` allows to rearrange items in a list
                // destructure the received values
                // source: index of item to move
                // destination: index of new location
                .onMove { (source: IndexSet, destination: Int) in
                    self.updateStore.updateList.move(
                        fromOffsets: source,
                        toOffset: destination
                    )
                }
            }
            .navigationBarTitle(Text("Updates"))
            .navigationBarItems(
                leading: Button(action: self.addUpdate) {
                    Text("Add Update")
                },
                trailing: EditButton()
            )
        }
    }
}

struct UpdatesList_Previews: PreviewProvider {
    static var previews: some View {
        UpdatesList()
    }
}
