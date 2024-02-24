//
//  iOS16ViewController.swift
//  UIKit Changes
//
//  Created by Ege Sucu on 24.02.2024.
//

import UIKit

@available(iOS 16, *)
class iOS16ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    private func defineStoryboard() -> UIStoryboard {
        UIStoryboard(name: "iOS16", bundle: nil)
    }
    
    
    @IBAction func navigateToPageControl(_ sender: UIButton) {
        if let viewController = defineStoryboard().instantiateViewController(withIdentifier: "pageControl") as? PageControlTextViewController {
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    @IBAction func navigateToCollectionView(_ sender: UIButton) {
        if let viewController = defineStoryboard().instantiateViewController(withIdentifier: "collectionView") as? CollectionViewResizedViewController {
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    @IBAction func navigateToSymbols(_ sender: UIButton) {
        if let viewController = defineStoryboard().instantiateViewController(withIdentifier: "symbols") as? SymbolsViewController {
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    @IBAction func navigateToSwiftUICells(_ sender: UIButton) {
        if let viewController = defineStoryboard().instantiateViewController(withIdentifier: "swiftUICells") as? SwiftUICellViewController {
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }

}
