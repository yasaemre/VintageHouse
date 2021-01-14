//
//  HomeController.swift
//  Ragnar
//
//  Created by Emre on 9/22/20.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let transition = SlideInTransition()
    
    @IBOutlet var whatToDoButton: UIButton!
    @IBOutlet var contactButton: UIButton!

    var gradientLayer: CAGradientLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactButton.layer.cornerRadius = 10
        whatToDoButton.layer.cornerRadius = 10
        contactButton.contentEdgeInsets = UIEdgeInsets(top: 8, left: 10, bottom: 8, right: 10)
        let button = UIButton()
        button.setImage(UIImage(named: "logoH"), for: .normal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        contactButton.layer.masksToBounds = true
       
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.setGradientBackground(colorOne: Colors.white, colorTwo: Colors.green)

    }

    func createGradientLayer() {
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor.lightGray.cgColor, UIColor.white.cgColor]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }

    @IBAction func didTapMenu(_ sender: UIBarButtonItem) {
        guard let menuVC = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController else { return }
        menuVC.modalPresentationStyle = .overCurrentContext
        menuVC.transitioningDelegate = self
        present(menuVC, animated: true)
    }
    

}

extension HomeViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
}
