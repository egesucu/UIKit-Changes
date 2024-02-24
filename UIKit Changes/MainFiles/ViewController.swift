//
//  ViewController.swift
//  UIKit Changes
//
//  Created by Ege Sucu on 4.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var iOSCollectionView: UICollectionView!
    
    let iOSVersions: [Version] = [.iOS13, .iOS14, .iOS15, .iOS16, .iOS17]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollection()
    }
    
    private func configureCollection() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        iOSCollectionView.setCollectionViewLayout(layout, animated: true)
        
        let nib = UINib(nibName: "VersionCollectionCell", bundle: nil)
        iOSCollectionView.register(nib, forCellWithReuseIdentifier: "VersionCell")
        
        iOSCollectionView.delegate = self
        iOSCollectionView.dataSource = self
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        iOSVersions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VersionCell", for: indexPath) as? VersionCollectionViewCell else { return .init() }
        let version = iOSVersions[indexPath.row]
        cell.configure(with: version)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let version = iOSVersions[indexPath.row]
        navigateVersionFeatures(from: version)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if UIDevice.current.orientation.isLandscape {
            return CGSize(width: 300, height: 300)
        } else {
            return CGSize(width: 170, height: 170)
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        self.iOSCollectionView.reloadData()
    }
    
    private func navigateVersionFeatures(from version: Version) {
        switch version {
            case .iOS13:
                let storyboard = UIStoryboard(name: "iOS13", bundle: nil)
                if let ios13View = storyboard.instantiateViewController(withIdentifier: "iOS13") as? iOS13ViewController {
                    self.navigationController?.pushViewController(ios13View, animated: true)
                }
            case .iOS14:
                if #available(iOS 14, *) {
                    let storyboard = UIStoryboard(name: "iOS14", bundle: nil)
                    if let iOS14View = storyboard.instantiateViewController(withIdentifier: "iOS14") as? iOS14ViewController {
                        self.navigationController?.pushViewController(iOS14View, animated: true)
                    }
                }
            case .iOS15:
                if #available(iOS 15, *) {
                    let storyboard = UIStoryboard(name: "iOS15", bundle: nil)
                    if let iOS15View = storyboard.instantiateViewController(withIdentifier: "iOS15") as? iOS15ViewController {
                        self.navigationController?.pushViewController(iOS15View, animated: true)
                    }
                }
            case .iOS16:
                if #available(iOS 16, *) {
                    let storyboard = UIStoryboard(name: "iOS16", bundle: nil)
                    if let iOS16View = storyboard.instantiateViewController(withIdentifier: "iOS16") as? iOS16ViewController {
                        self.navigationController?.pushViewController(iOS16View, animated: true)
                    }
                }
            case .iOS17:
                if #available(iOS 17, *) {
                    let storyboard = UIStoryboard(name: "iOS17", bundle: nil)
                    if let iOS17View = storyboard.instantiateViewController(withIdentifier: "iOS17") as? iOS17ViewController {
                        self.navigationController?.pushViewController(iOS17View, animated: true)
                    }
                }
            default: break
        }
    }
    
    
}
