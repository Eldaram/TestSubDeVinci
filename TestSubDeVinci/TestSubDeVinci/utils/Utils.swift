//
//  Utils.swift
//  TestSubDeVinci
//
//  Created by COURS on 19/04/2024.
//

import Foundation

class Utils {
    static func extractString(str: String?) -> String {
        guard let _str: String = str else {
            return ""
        }
        return _str
    }
    
    static func extractInt(num: Int16?) -> String {
        guard let _num: Int16 = num else {
            return "Non noté"
        }
        return String(_num)
    }
}
