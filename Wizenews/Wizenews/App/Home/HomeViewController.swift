//
//  HomeViewController.swift
//  Wizenews
//
//  Created by Marlon David Ruiz Arroyave on 8/01/22.
//

import UIKit

class HomeViewController: UIViewController {

	@IBOutlet weak var newsListController: UITableView!
	@IBOutlet weak var heightConstraint: NSLayoutConstraint!
	
	private struct K {
		static let count = 10
		static let rowHeight = 43.5
		static let cellIdentifier = "Cell"
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()		
		heightConstraint.constant = CGFloat(Double(K.count) * K.rowHeight)
    }

}

extension HomeViewController: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return K.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath)
		cell.textLabel?.text = "\(indexPath.row)"
		return cell
	}
	
}
