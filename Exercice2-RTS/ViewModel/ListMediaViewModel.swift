//
//  ListMediaViewModel.swift
//  Exercice2-RTS
//
//  Created by Ines BOKRI on 29/02/2024.
//

import Foundation

class ListMediaViewModel {
    
    // MARK: - Properties
    var mediaList = [Media]()
    
    // MARK: - Functions
    func fetchData(completion: @escaping () -> Void) {
        guard let url = URL(string: "https://il.srgssr.ch/integrationlayer/2.0/rts/mediaList/video/latestEpisodes")
        else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let self = self,
                  let data = data
            else { return }
            
            do {
                let decoder = JSONDecoder()
                let mediaListResponse = try decoder.decode(MediaListResponse.self, from: data)
                self.mediaList = mediaListResponse.mediaList
                DispatchQueue.main.async {
                    completion()
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
}
