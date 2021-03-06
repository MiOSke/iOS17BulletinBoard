//
//  NameTableViewController.swift
//  iOS17BulletinBoard
//
//  Created by Michael Kampouris on 2/5/18.
//  Copyright © 2018 broCode. All rights reserved.
//

import UIKit

class NameTableViewController: UITableViewController {
    @IBOutlet weak var messageTextField: UITextField!
    
    @IBAction func postButtonPressed(_ sender: Any) {
        guard let text = messageTextField.text,!text.isEmpty else { return }
        MessageController.shared.saveNewMessageWith(text: text)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //listen for a message and act accordingly
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return MessageController.shared.messages.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath)
        
        let message = MessageController.shared.messages[indexPath.row]
        cell.textLabel?.text = message.text
        cell.detailTextLabel?.text = message.date.description
        return cell
    }

}
