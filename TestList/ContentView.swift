//
//  ContentView.swift
//  TestList
//
//  Created by Diego Ballesteros on 08/08/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var itemsList: [String] = ["Eggs", "Apple", "Phone"]
    @State private var viewModel = ListViewModel()
    @State private var itemName = ""
    @State private var editItemName = ""
    @State private var editedName = ""
    @State private var showEdit = false
    
    var body: some View {
        VStack {
            HStack {
                TextField("e.g egss", text: $itemName)
                
                Button {
                    
                    viewModel.createNewItem(itemName: itemName)
                    itemName = ""
//                    itemsList.append(itemName)
//                    itemName = ""
                } label: {
                    Text("Submit")
                }
                .buttonStyle(.borderedProminent)
            }
            .padding(.horizontal)
            
            
            List {
                ForEach(viewModel.itemsList.indices, id: \.self) { index in
                    Text(viewModel.itemsList[index].name)
                        .swipeActions {
                            Button {
                                itemsList.removeAll { name in
                                    name == itemsList[index]
                                }
                            } label: {
                                Text("Delete")
                            }
                            .tint(.red)
                            
                            Button {
                                showEdit.toggle()
                                editItemName = itemsList[index]
                                editedName = itemsList[index]
                                
                            } label: {
                                Text("Edit")
                            }
                            .tint(.blue.opacity(0.7))
                            
                            
                        }
                        .alert("Edit", isPresented: $showEdit) {
                            
                            TextField("", text: $editItemName)
                            
                            Button {
                                
//                                for index in itemsList.indices {
//                                    if itemsList[index] == editedName {
//                                        withAnimation {
//                                            itemsList[index] = editItemName
//                                        }
//                                        editItemName = ""
//                                    }
//                                }
                            } label: {
                                Text("Edit")
                            }
                            
                            Button {
                                
                            } label: {
                                Text("Cancel")
                            }
                            
                        }
                }
            }
            .listStyle(.plain)
        }
        //        .padding()
    }
}

#Preview {
    ContentView()
}
