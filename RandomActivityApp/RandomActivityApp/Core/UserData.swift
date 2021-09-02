//
//  UserData.swift
//  RandomActivityApp
//
//  Created by Rafael Basso on 31/08/21.
//

import UIKit

class UserData {
    
}

extension UserData {
    
    // Salvar array de booleans. FILTROS
    
    static public func saveFilters(filter: TypeFilter) {
        UserDefaults.standard.set(filter.getValuesAsBool(), forKey: "FilterArray")
    }
    
    // Load array de booleans. Retornar um array de booleans FILTROS
    
    static public func getFilters() -> TypeFilter {
        
        let array = UserDefaults.standard.array(forKey: "FilterArray") as? [Bool] ?? [Bool]()
        
        return TypeFilter(array: array)
    }

    
}
