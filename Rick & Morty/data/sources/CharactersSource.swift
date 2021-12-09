//
//  CharactersSource.swift
//  Rick & Morty
//
//  Created by Adrian Devezin on 10/25/21.
//

import Foundation

class CharactersSource {
    func getCharacters(_ success: @escaping ([Character]) -> Void) {
        let session = URLSession.shared
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {
            print("invalid url")
            return
        }
        session.dataTask(with: url, completionHandler: { data, response, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(CharactersResponse.self, from: data)
                    DispatchQueue.main.async {
                        // update our UI
                        success(decodedData.results)
                    }
                } catch {
                    let str = String(data: data, encoding: .utf8)
                    print(error)
                    print(str ?? "")
                }
                return
            }
            
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
            
        }
        ).resume()
        
    }
}
