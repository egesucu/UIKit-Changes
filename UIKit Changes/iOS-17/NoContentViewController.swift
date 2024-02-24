//
//  NoContentViewController.swift
//  UIKit Changes
//
//  Created by Ege Sucu on 24.02.2024.
//

import UIKit

@available(iOS 17, *)
class NoContentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var configuration = UIContentUnavailableConfiguration.empty()
        
        configuration.image = UIImage(systemName: "person.fill.xmark.rtl")
        configuration.text = "We couldn't find the person"
        configuration.secondaryText = "Maybe you could be my father?"
        
        self.contentUnavailableConfiguration = configuration
    }


}
