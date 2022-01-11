//
//  FavouritesViewController.swift
//  Wizenews
//
//  Created by Marlon David Ruiz Arroyave on 8/01/22.
//

import UIKit

class FavouritesViewController: UIViewController {
	
	@IBOutlet weak var heightListContainer: NSLayoutConstraint!
	private var favouritesListController: FavouritesListController?
	
	private struct K {
		static let favouritesListControllerSegue = "FavouritesListControllerSegue"
	}

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Navigation
	
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == K.favouritesListControllerSegue {
			favouritesListController = segue.destination as? FavouritesListController
			favouritesListController?.delegate = self
		}
    }

}

extension FavouritesViewController: FavouritesListControllerDelegate {
	
	func heightConstraintChanged(to value: CGFloat) {
		heightListContainer.constant = value
	}
	
}
