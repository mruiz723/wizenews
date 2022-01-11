//
//  FavouritesListController.swift
//  Wizenews
//
//  Created by Marlon David Ruiz Arroyave on 10/01/22.
//

import UIKit

protocol FavouritesListControllerDelegate: AnyObject {
	func heightConstraintChanged(to value: CGFloat)
}

class FavouritesListController: UIViewController {

	@IBOutlet weak var favouritesTableView: UITableView!
	weak var delegate: FavouritesListControllerDelegate?
	
	private struct K {
		static let count = 30
		static let rowHeight = 43.5
		static let cellIdentifier = "FavouriteCell"
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		let value = CGFloat(Double(K.count) * K.rowHeight)
		delegate?.heightConstraintChanged(to: value)
    }
	
}

extension FavouritesListController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return K.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath)
		cell.textLabel?.text = "\(indexPath.row)"
		return cell
	}
	
	
}
