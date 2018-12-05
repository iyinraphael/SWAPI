//
//  TableViewController.swift
//  SWAPI
//
//  Created by Iyin Raphael on 12/5/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, UISearchBarDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Model.shared.updateHandler = { self.tableView.reloadData()}
    }
    
    //Work to do when this object is released back to memory
    deinit {
        //We're cleanig up after ourselves
        Model.shared.updateHandler = nil
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searhTerm = searchBar.text, !searhTerm.isEmpty else {return}
        Model.shared.search(for: searhTerm)
    }
    
    static let reuseIdenfier = "cell"
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  Model.shared.numberOfpeople()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseIdenfier, for: indexPath) as? TableViewCell else {
            fatalError("Unable to retrieve and cast cell") }
            let person = Model.shared.person(at: indexPath.row)
            
        cell.nameLabel.text = person.name
        cell.birthYearLabel.text = "DOB: \(person.birthYear)"
        cell.heightLabel.text = "Height: \(person.height) cm"

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
