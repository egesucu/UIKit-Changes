//
//  SymbolsViewController.swift
//  UIKit Changes
//
//  Created by Ege Sucu on 24.02.2024.
//

import UIKit

@available(iOS 16, *)
class SymbolsViewController: UIViewController {
    
    @IBOutlet weak var automaticRenderedImageView: UIImageView!
    @IBOutlet weak var monochromeImageView: UIImageView!
    @IBOutlet weak var hierarchicImageView: UIImageView!
    @IBOutlet weak var slider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        automaticRenderedImageView.image = UIImage(systemName: "airpodsmax")
        automaticRenderedImageView.tintColor = .systemGreen
        automaticRenderedImageView.preferredSymbolConfiguration = UIImage.SymbolConfiguration(font: .systemFont(ofSize: 40))
        
        monochromeImageView.image = UIImage(
            systemName: "trash",
            variableValue: 0,
            configuration: UIImage.SymbolConfiguration(paletteColors: [.systemBrown])
        )
        
        monochromeImageView.preferredSymbolConfiguration = UIImage.SymbolConfiguration(font: .systemFont(ofSize: 40))
        
        
        hierarchicImageView.image = UIImage(
            systemName: "speaker.wave.2.fill",
            variableValue: Double(slider.value),
            configuration: UIImage.SymbolConfiguration(paletteColors: [.systemBrown])
        )
        hierarchicImageView.preferredSymbolConfiguration = UIImage.SymbolConfiguration(font: .systemFont(ofSize: 40))
        
        let changeAction = UIAction { [weak self] _ in
            guard let self else { return }
            self.hierarchicImageView.image = UIImage(
                systemName: "speaker.wave.2.fill",
                variableValue: Double(self.slider.value),
                configuration: UIImage.SymbolConfiguration(paletteColors: [.systemBrown])
            )
            self.hierarchicImageView.preferredSymbolConfiguration = UIImage.SymbolConfiguration(font: .systemFont(ofSize: 40))
        }
        slider.addAction(changeAction, for: .valueChanged)

    }

}
