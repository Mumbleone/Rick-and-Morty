//
//  ViewModel.swift
//  Rick & Morty
//
//  Created by Student on 11/11/21.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
    
    private let repo: Repository
    
    @Published
    var viewState: ViewStates = .loading
    
    init(repository: Repository = RepositoryImpl()) {
        repo = repository
        list()
    }
    
    func list() {
        repo.getCharacters({ character in
            let characterPresentables: [CharacterPresentable] = character.compactMap { characters in
                let characterName = characters.name
                let characterImage = characters.image
                return CharacterPresentable(name: characterName, imageUrl: characterImage)
            }
            self.viewState = .characters(ViewState(characters: characterPresentables))
        })
    }
}
