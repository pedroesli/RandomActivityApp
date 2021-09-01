//
//  Activities.swift
//  RandomActivityApp
//
//  Created by Pedro Ésli Vieira do Nascimento on 01/09/21.
//

import Foundation

struct Activity: Decodable{
    var activity: String
    var accessibility: Float
    var type: String
    var participants: Int
    var key: String
}
