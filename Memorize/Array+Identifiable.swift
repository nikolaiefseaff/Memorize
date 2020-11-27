//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Nicholas Efseaff on 11/15/20.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching someElement: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == someElement.id {
                return index
            }
        }
        return nil
    }
}
