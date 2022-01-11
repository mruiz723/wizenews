//
//  SettingsListController.swift
//  Wizenews
//
//  Created by Marlon David Ruiz Arroyave on 10/01/22.
//

import UIKit

class SettingsListController: UIViewController {
	
	@IBOutlet weak var settingsTableView: UITableView!
	
	var heightHandler: ((_ newValue: CGFloat) -> Void)?
    
	private struct K {
		static let count = 50
		static let contentSize = "contentSize"
		static let cellIdentifier = "SettingCell"
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
			
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		settingsTableView.addObserver(self,
									  forKeyPath: K.contentSize,
									  options: .new,
									  context: nil)
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		settingsTableView.removeObserver(self, forKeyPath: K.contentSize)
	}
	
	override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
		if keyPath == K.contentSize {
			guard
				let newValue = change?[.newKey],
				let newSize = newValue as? CGSize
			else {
				return
			}
			heightHandler?(newSize.height)
		}
	}

}

extension SettingsListController: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return K.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath)
		cell.textLabel?.text = "\(indexPath.row)"
		return cell
	}
	
}
