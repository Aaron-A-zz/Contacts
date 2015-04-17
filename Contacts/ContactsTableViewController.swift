//
//  ContactsTableViewController.swift
//  Contacts
//
//  Created by Aaron Ackerman on 4/14/15.
//  Copyright (c) 2015 Aaron Ackerman. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController {
    
    var contacts = [Contact]()

    override func viewDidLoad() {
        super.viewDidLoad()

        let mike = Contact(name: "Mike", phoneNumber: "###-###-####")
        let mindy = Contact(name: "Mindy", phoneNumber: "###-###-###")
        
        self.contacts.append(mike)
        self.contacts.append(mindy)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return self.contacts.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...
        let contact = self.contacts[indexPath.row]
        
        if let name = contact.name {
            cell.textLabel?.text = name
        } else {
            cell.textLabel?.text = "No Name"
        }
        
        return cell
    }


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let indexPath = self.tableView.indexPathForCell(sender as! UITableViewCell)!
        let contact = self.contacts[indexPath.row]
        var destination = segue.destinationViewController as! DetailViewController
        destination.contact = contact

    }

}
