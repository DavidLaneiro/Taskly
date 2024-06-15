//
//  StringUtils.swift
//  Taskly
//
//  Created by David  Lourenço on 16/06/2024.
//

import Foundation

class StringUtils{
    
    static func trim(_ string: String) -> String {
        return string.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
}
