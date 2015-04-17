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
        
        let moveButton = UIBarButtonItem(barButtonSystemItem: .Edit, target: self, action: Selector("toggleEdit"))
        self.navigationItem.leftBarButtonItem = moveButton
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: Selector("addContact"))
        navigationItem.rightBarButtonItem = addButton
        
        let longpress = UILongPressGestureRecognizer(target: self, action: "longPressGestureRecognized:")
        
        tableView.addGestureRecognizer(longpress)
        
        let mike = Contact(name: "Mike", phoneNumber: "###-###-####")
        let mindy = Contact(name: "Mindy", phoneNumber: "###-###-###")
        
        self.contacts.append(mike)
        self.contacts.append(mindy)
        

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
    
    //This allows the table to be edited
    override func  tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            self.contacts.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    func toggleEdit() {
        self.tableView.setEditing(!self.tableView.editing, animated: true)
        //Change the Edit Name to Done
        let moveButton = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: Selector("toggleEdit"))
        self.navigationItem.leftBarButtonItem = moveButton
    }
    
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        let contactMoving = self.contacts.removeAtIndex(fromIndexPath.row)
        self.contacts.insert(contactMoving, atIndex: toIndexPath.row)
    }
    
    //Adding Editing Style to remove delete buttons during editing mode.
    override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        if tableView.editing {
            return .None
        } else {
            return .Delete
        }
    }
    
    override func tableView(tableView: UITableView, shouldIndentWhileEditingRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
    //Reload the data! 
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    //New Contact!
    func addContact() {
        let newContact = Contact(name: "New Contact", phoneNumber: "")
        self.contacts.append(newContact)
        let newIndexPath = NSIndexPath(forRow: self.contacts.count - 1, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Automatic)
    }


}
