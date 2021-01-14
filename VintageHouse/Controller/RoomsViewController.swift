//
//  BrandsViewController.swift
//  Ragnar
//
//  Created by Home on 9/24/20.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit
import SwiftPhotoGallery

class RoomsViewController: UIViewController, SwiftPhotoGalleryDataSource, SwiftPhotoGalleryDelegate {
    
    let roomImages = [["g1.jpeg", "g2.jpeg", "g3.jpeg"],["b1.jpeg", "b2.jpeg", "b3.jpeg"], ["gr1.jpeg", "gr2.jpeg", "gr3.jpeg"]]
    var galleryTag = 0
    let brandCell = ActivityCell()
    
    func numberOfImagesInGallery(gallery: SwiftPhotoGallery) -> Int {
        return roomImages.count
    }
    
    
    func imageInGallery(gallery: SwiftPhotoGallery, forIndex: Int) -> UIImage? {
        return UIImage(named: roomImages[galleryTag][forIndex])
    }
    
    func galleryDidTapToClose(gallery: SwiftPhotoGallery) {
        dismiss(animated: true, completion: nil)

    }
    @IBOutlet var tableView: UITableView!
    
    @objc func photosButtonTapped(_ sender: UIButton) {
        let gallery = SwiftPhotoGallery(delegate: self, dataSource: self)
        print("\(sender.tag)")
        galleryTag = sender.tag
        gallery.backgroundColor = UIColor.black
        gallery.pageIndicatorTintColor = UIColor.gray.withAlphaComponent(0.5)
        gallery.currentPageIndicatorTintColor = UIColor.white
        gallery.hidePageControl = false
        
        present(gallery, animated: true, completion: nil)
    }
    
    var rooms = [Room]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        rooms = createBrandArray()
       let button = UIButton()
       button.setImage(UIImage(named: "logoH"), for: .normal)
       navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
 
    }
    func createBrandArray() -> [Room] {
        var roomArr = [Room]()

        let room0 = Room(image: UIImage(named: "brand0")!, title: "Black Room")
        let room1 = Room(image: UIImage(named: "brand1")!, title: "Blue Room")
        let room2 = Room(image: UIImage(named: "brand2")!, title: "Green Room")
        
        roomArr.append(room0)
        roomArr.append(room1)
        roomArr.append(room2)
        return roomArr
    }
}


extension RoomsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let room = rooms[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "brandCell") as! ActivityCell
        cell.photosButton.tag = indexPath.row
        cell.photosButton.addTarget(self, action: #selector(photosButtonTapped), for: .touchUpInside)
        cell.setActivity(brand: room)
        return cell
        
        
    }
    
    
}
