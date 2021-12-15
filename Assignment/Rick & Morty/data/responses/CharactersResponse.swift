//
//  CharactersResponse.swift
//  Rick & Morty
//
//  Created by Adrian Devezin on 11/2/21.
//

import Foundation

struct CharactersResponse: Codable {
    let results: [Character]
    let info: Info
    
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
}
