//
//  Repository.swift
//  Rick & Morty
//
//  Created by Adrian Devezin on 10/27/21.
//

import Foundation

protocol Repository {
    func getCharacters(_ characters: @escaping ([Character]) -> Void)
}


class RepositoryImpl: Repository {
    
    private let charactersSource = CharactersSource()
    
    func getCharacters(_ characters: @escaping ([Character]) -> Void) {
        charactersSource.getCharacters(characters)
    }
}
