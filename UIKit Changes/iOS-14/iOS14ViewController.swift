//
//  iOS14ViewController.swift
//  UIKit Changes
//
//  Created by Ege Sucu on 12.02.2024.
//

import UIKit


@available(iOS 14, *)
typealias CollectionDelegate = UICollectionViewDataSource & UICollectionViewDelegate & UICollectionViewDelegateFlowLayout

@available(iOS 14, *)
class iOS14ViewController: UIViewController {
    
    @IBOutlet weak var mailCollection: UICollectionView!
    @IBOutlet weak var colorDefineLabel: UILabel!
    @IBOutlet weak var actionableButton: UIButton!
    
    var mailConfig: UICollectionView.CellRegistration<MailCollectionViewCell,Mail>?
        

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mailConfig = createMailConfig()
        
        configureAction()
        mailCollection.dataSource = self
        mailCollection.delegate = self

    }
    
    private func configureAction() {
        let action = UIAction(
            title: "Select"
        ) { action in
            print("\(action.title) action is triggered.")
        }
        
        actionableButton.addAction(action, for: .touchUpInside)
    }
    
    @IBAction func selectColor(_ sender: UIButton) {
        let picker = UIColorPickerViewController()
        picker.delegate = self
        self.present(picker, animated: true)
    }
    
    func createMailConfig() -> UICollectionView.CellRegistration<MailCollectionViewCell,Mail> {
        UICollectionView
            .CellRegistration<MailCollectionViewCell,Mail> { cell, indexPath, mail in
                cell.countLabel.text = "\(mail.count)"
                cell.iconView.image = mail.icon
                cell.titleLabel.text = mail.title
            }
    }

}

@available(iOS 14, *)
extension iOS14ViewController: UIColorPickerViewControllerDelegate {
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        // Trigger another function on dismissing the sheet.
    }
    
    /// Note: This will be changed in iOS 15 and becomes `colorPickerViewController(_ viewController: UIColorPickerViewController, didSelect color: UIColor, continuously: Bool)`
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        let rgba = viewController.selectedColor.rgba
        colorDefineLabel.text = "Selected color is: \n Red: \(rgba.red) \n Green: \(rgba.green) \n Blue: \(rgba.blue) \n Alpha: \(rgba.alpha)"
    }
}

@available(iOS 14, *)
extension UIColor {
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return (red, green, blue, alpha)
    }
}

@available(iOS 14, *)
extension iOS14ViewController: CollectionDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        mockMailData.count
    }
    
  
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let mailConfig else { return .init() }
        let mail = mockMailData[indexPath.row]
        return collectionView.dequeueConfiguredReusableCell(
            using: mailConfig,
            for: indexPath,
            item: mail
        )
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        CGSize(width: 200, height: 200)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        .init(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        10
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        10
    }
}
