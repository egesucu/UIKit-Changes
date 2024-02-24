//
//  iOS13ViewController.swift
//  UIKit Changes
//
//  Created by Ege Sucu on 12.02.2024.
//

import UIKit

class iOS13ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func diffableTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "iOS13", bundle: nil)
        if let view = storyboard.instantiateViewController(withIdentifier: "diffable-data") as? DiffableDataViewController {
            self.navigationController?.pushViewController(view, animated: true)
        }
        
    }
    
    @IBAction func compositonalTapped(_ sender: UIButton) {
        self.navigationController?.pushViewController(WeatherViewController(), animated: true)
    }

}
