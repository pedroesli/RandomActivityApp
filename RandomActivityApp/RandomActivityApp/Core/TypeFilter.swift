//
//  TypeFilterModel.swift
//  RandomActivityApp
//
//  Created by Rafael Basso on 01/09/21.
//

import Foundation

public struct TypeFilter {
    
    private var values = [false, false, false, false, false, false, false, false, false]
    
    init(array: [Bool]) {
        if !array.isEmpty {
            values = array
        }
    }
    
    init() {}
    
    public func getValuesAsBool() -> [Bool] { values }
    
    public func getValuesAsTuple() -> (Education: Bool,
                                       Recreational: Bool,
                                       Relaxation: Bool,
                                       Charity: Bool,
                                       Cooking: Bool,
                                       Music: Bool,
                                       Busywork: Bool,
                                       DIY: Bool,
                                       Social: Bool) {
        
        return (values[0], values[1], values[2], values[3], values[4], values[5], values[6], values[7], values[8])
        
    }
    
}
