//
//  MediaCell.swift
//  Exercice2-RTS
//
//  Created by Ines BOKRI on 29/02/2024.
//

import UIKit

class MediaCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    
    // MARK: - Functions
    func setupMediaCell(_ media: Media) {
        titleLabel.text = media.title
        let durationInMinutes = Int((media.duration/60).truncatingRemainder(dividingBy: 60))
        durationLabel.text = String(durationInMinutes) + " min"
    }
}
