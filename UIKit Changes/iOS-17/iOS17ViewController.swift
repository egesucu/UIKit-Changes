//
//  iOS17ViewController.swift
//  UIKit Changes
//
//  Created by Ege Sucu on 24.02.2024.
//

import UIKit

@available(iOS 17, *)
class iOS17ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //print("View will appear")
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        //print("View is appearing")
        //print("viewIsAppearing will also appear before viewwilllayoutsubviews and ideal for updating the UI, and is iOS 13+")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //print("View did appear")
    }
    
    
    @IBAction func navigateToUnAvailableView() {
        let storyBoard = UIStoryboard(name: "iOS17", bundle: nil)
        if let viewController = storyBoard.instantiateViewController(withIdentifier: "contentUnavailable") as? NoContentViewController {
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    @IBAction func navigateToPageControl() {
        let storyBoard = UIStoryboard(name: "iOS17", bundle: nil)
        if let viewController = storyBoard.instantiateViewController(withIdentifier: "pageControlTimer") as? PageControlTimerViewController {
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

// Finally!
@available(iOS 17, *)
#Preview {
    let storyboard = UIStoryboard(name: "iOS17", bundle: nil)
    let vc = storyboard.instantiateViewController(withIdentifier: "iOS17") as? iOS17ViewController ?? iOS17ViewController()
    return UINavigationController(rootViewController: vc)
}
