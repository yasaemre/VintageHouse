//
//  CompanyViewController.swift
//  Ragnar
//
//  Created by Home on 9/24/20.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit
import SwiftPhotoGallery

class VintageHouseViewController: UIViewController, SwiftPhotoGalleryDataSource, SwiftPhotoGalleryDelegate {


    @IBOutlet weak var galleryButton: UIButton!
    @IBOutlet var ourProductsButton: UIButton!
    @IBOutlet var contactButton: UIButton!
    
    var gradientLayer: CAGradientLayer!
    let roomImages = ["gallery1.jepg","gallery2.jepg","gallery3.jepg","gallery4.jepg","gallery5.jepg","gallery6.jepg"]
    
    func numberOfImagesInGallery(gallery: SwiftPhotoGallery) -> Int {
        return roomImages.count
    }
    
    
    func imageInGallery(gallery: SwiftPhotoGallery, forIndex: Int) -> UIImage? {
        return UIImage(named: roomImages[forIndex])
    }
    
    func galleryDidTapToClose(gallery: SwiftPhotoGallery) {
        dismiss(animated: true, completion: nil)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButtons()
        //createGradientLayer()
    }
    
    func createGradientLayer() {
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor.lightGray.cgColor, UIColor.white.cgColor]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    @IBAction func galleryButtonTapped(_ sender: Any) {
        let gallery = SwiftPhotoGallery(delegate: self, dataSource: self)
        gallery.backgroundColor = UIColor.black
        gallery.pageIndicatorTintColor = UIColor.gray.withAlphaComponent(0.5)
        gallery.currentPageIndicatorTintColor = UIColor.white
        gallery.hidePageControl = false
        
        present(gallery, animated: true, completion: nil)
    }
    func configureButtons() {
        ourProductsButton.contentHorizontalAlignment = .center
        ourProductsButton.contentEdgeInsets = UIEdgeInsets(top: 8, left: 10, bottom: 8, right: 10)
        ourProductsButton.layer.cornerRadius = 11
        
        galleryButton.contentHorizontalAlignment = .center
        galleryButton.contentEdgeInsets = UIEdgeInsets(top: 8, left: 10, bottom: 8, right: 10)
        galleryButton.layer.cornerRadius = 11
        
        contactButton.contentHorizontalAlignment = .center
        contactButton.contentEdgeInsets = UIEdgeInsets(top: 8, left: 10, bottom: 8, right: 10)
        contactButton.layer.cornerRadius = 11
    }
    
    
 

}
