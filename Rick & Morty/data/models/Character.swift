//
//  Character.swift
//  Rick & Morty
//
//  Created by Adrian Devezin on 10/25/21.
//

import Foundation

struct Character: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Origin
    let location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
    
}

/**
 id    int    The id of the character.
 name    string    The name of the character.
 status    string    The status of the character ('Alive', 'Dead' or 'unknown').
 species    string    The species of the character.
 type    string    The type or subspecies of the character.
 gender    string    The gender of the character ('Female', 'Male', 'Genderless' or 'unknown').
 origin    object    Name and link to the character's origin location.
 location    object    Name and link to the character's last known location endpoint.
 image    string (url)    Link to the character's image. All images are 300x300px and most are medium shots or portraits since they are intended to be used as avatars.
 episode    array (urls)    List of episodes in which this character appeared.
 url    string (url)    Link to the character's own URL endpoint.
 created    string    Time at which the character was created in the database.
 */
