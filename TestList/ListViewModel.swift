//
//  ListViewModel.swift
//  TestList
//
//  Created by Diego Ballesteros on 08/08/24.
//

import Foundation

@Observable
class ListViewModel: Identifiable {
    
    
    var itemsList: [ListItem] = []
    
    
    func createNewItem(itemName: String) {
        
        let newItem = ListItem(name: itemName)
        itemsList.append(newItem)
//        itemName = ""
        
    }
    
    
    
    
    
    
    
}
