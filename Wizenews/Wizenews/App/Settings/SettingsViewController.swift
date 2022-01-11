//
//  SettingsViewController.swift
//  Wizenews
//
//  Created by Marlon David Ruiz Arroyave on 8/01/22.
//

import UIKit

class SettingsViewController: UIViewController {
	
	@IBOutlet weak var heightSettingsListConstraint: NSLayoutConstraint!
	
	private var settingsListController: SettingsListController?
	
	private struct K {
		static let settingsListControllerScene = "SettingsListControllerScene"
	}

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == K.settingsListControllerScene {
			settingsListController = segue.destination as? SettingsListController
			settingsListController?.heightHandler = { [weak self] newHeight in
				self?.heightSettingsListConstraint.constant = newHeight
			}
		}
    }

}
