//
//  ViewStates.swift
//  Rick & Morty
//
//  Created by Adrian Devezin on 10/27/21.
//

import Foundation

enum ViewStates {
    case loading
    case characters(ViewState)
}



struct ViewState {
    
    let characters: [CharacterPresentable]
}
