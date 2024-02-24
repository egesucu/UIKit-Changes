//
//  PageControlTimerViewController.swift
//  UIKit Changes
//
//  Created by Ege Sucu on 24.02.2024.
//

import UIKit

@available(iOS 17.0, *)
class PageControlTimerViewController: UIViewController {
    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollection()
        configurePageControl()
    }
    
    func configurePageControl() {
        let controlProgress = UIPageControlTimerProgress(preferredDuration: 3)
        controlProgress.currentProgress = 0
        controlProgress.delegate = self
        controlProgress.resetsToInitialPageAfterEnd = true
        pageControl.progress = controlProgress
        pageControl.numberOfPages = mockImages.count
        controlProgress.resumeTimer()
    }
    
    private func configureCollection() {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, environment in
            ApplicationLayout.shared.largeSlideSection()
        }
        collection.setCollectionViewLayout(layout, animated: true)
        
        collection.dataSource = self
        collection.isUserInteractionEnabled = false
        collection.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        collection.setCollectionViewLayout(layout, animated: false)
        collection.isPagingEnabled = true
        collection.showsHorizontalScrollIndicator = false
    }

}

@available(iOS 17.0, *)
extension PageControlTimerViewController: UIPageControlTimerProgressDelegate {
    
    func pageControlTimerProgress(_ progress: UIPageControlTimerProgress, shouldAdvanceToPage page: Int) -> Bool {
        collection.scrollToItem(at: .init(item: page, section: 0), at: .centeredHorizontally, animated: true)
        return true
        
    }
    
    func pageControlProgressVisibilityDidChange(_ progress: UIPageControlProgress) {
        print("Page control is visible?: \(progress.isProgressVisible)")
    }
    
}

@available(iOS 17.0, *)
extension PageControlTimerViewController: CollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mockImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        .init(width: self.view.frame.width, height: 400)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as? ImageCollectionViewCell else {
            return .init()
        }
        let image = mockImages[indexPath.row]
        cell.configure(with: image)
        return cell
    }
}

let mockImages: [UIImage] = [.image1, .image2, .image3, .image4]
