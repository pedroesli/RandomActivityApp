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
    
    public func getActiveValuesAsString() -> [String] {
        
        var tmpValues = [String]()
        
        for i in 0...(values.count - 1) {
            
            if values[i] == true {
                switch i {
                case 0:
                    tmpValues.append("education")
                case 1:
                    tmpValues.append("recreational")
                case 2:
                    tmpValues.append("relaxation")
                case 3:
                    tmpValues.append("charity")
                case 4:
                    tmpValues.append("cooking")
                case 5:
                    tmpValues.append("music")
                case 6:
                    tmpValues.append("busywork")
                case 7:
                    tmpValues.append("diy")
                case 8:
                    tmpValues.append("social")
                default:
                    break
                }
            }
        }
        
        return tmpValues
        
    }
    
}
