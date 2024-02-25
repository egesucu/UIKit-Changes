//
//  iOS15ViewController.swift
//  UIKit Changes
//
//  Created by Ege Sucu on 12.02.2024.
//

import UIKit
import CoreLocationUI
import MapKit

@available(iOS 15, *)
class iOS15ViewController: UIViewController {
    
    @IBOutlet weak var locationStack: UIStackView!
    @IBOutlet weak var currentLocationLabel: UILabel!
    @IBOutlet weak var buttonStack: UIStackView!
    @IBOutlet weak var sheetButton: UIButton!
    
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        createCustomButtons()
        addLocationButton()
        showSheetAction()
    }
    
    private func addLocationButton() {
        let button = CLLocationButton()
        button.fontSize = 20
        button.icon = .arrowFilled
        button.cornerRadius = 10
        button.label = .sendCurrentLocation
        let action = UIAction { [weak self] _ in
            guard let self else { return }
            self.getLocation()
        }
        button.addAction(action, for: .touchUpInside)
        locationStack.addArrangedSubview(button)
    }
    
    private func getLocation() {
        self.locationManager.requestLocation()
    }
    
    private func createCustomButtons() {
        let printAction = UIAction { _ in
            print("Action Pressed")
        }
        let firstButton = UIButton(type: .system, primaryAction: printAction)
        
        firstButton.configuration = .bordered()
        firstButton.configuration?.baseBackgroundColor = .white
        firstButton.configuration?.baseBackgroundColor = .green
        firstButton.configuration?.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
        firstButton.configuration?.imagePlacement = .top
        
        let secondButton = UIButton(type: .system, primaryAction: printAction)
        secondButton.configuration = .plain()
        let thirdButton = UIButton(type: .system, primaryAction: printAction)
        thirdButton.configuration = .borderedProminent()
        let fourthButton = UIButton(type: .system, primaryAction: printAction)
        fourthButton.configuration = .borderedTinted()
        
        buttonStack.addArrangedSubview(firstButton)
        buttonStack.addArrangedSubview(secondButton)
        buttonStack.addArrangedSubview(thirdButton)
        buttonStack.addArrangedSubview(fourthButton)
    }
    
    private func showSheetAction() {
        let imageview = UIImageView(image: .ios15)
        imageview.frame = .init(x: 100, y: 100, width: 50, height: 50)
        let vc = UIViewController()
        vc.view.backgroundColor = .blue
        vc.view.addSubview(imageview)
        
        
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.preferredCornerRadius = 10
            sheet.prefersGrabberVisible = true
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.prefersEdgeAttachedInCompactHeight = true
            sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
        }
        
        
        let action = UIAction(title: "Share") { [weak self] action in
            self?.present(vc, animated: true)
        }
        sheetButton.addAction(action, for: .touchUpInside)
    }

}

@available(iOS 15, *)
extension iOS15ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lastLocation = locations.last {
            let coordinate = lastLocation.coordinate
            currentLocationLabel.text = "Current Location - Latitude: \(coordinate.latitude) & Longitude: \(coordinate.longitude)"
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print(error.localizedDescription)
    }
    
}
