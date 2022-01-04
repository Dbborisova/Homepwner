//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by Desislava Borisova on 11/22/21.
//

import UIKit

class ItemsViewController: UITableViewController{
    
    var allItems = [Item]()
    
    func createItem()
    {
        let newItem = Item(random: true)
        
        allItems.append(newItem)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    
    func removeItem(_ item: Item){
        if let index = allItems.firstIndex(of: item){
            allItems.remove(at: index)
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let item = allItems[indexPath.row]
            removeItem(item)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func moveItemAtIndex( fromIndex: Int, toIndex: Int){
        if fromIndex == toIndex{
            return
        }
        
        let movedItem = allItems[fromIndex]
        
        allItems.remove(at: fromIndex)
        
        allItems.insert(movedItem, at: toIndex)
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        moveItemAtIndex(fromIndex: sourceIndexPath.row, toIndex: destinationIndexPath.row)
    }
    
    var dollarAmount = 0
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = allItems[indexPath.row]
        
        dollarAmount = item.valueInDollars
        self.performSegue(withIdentifier: "ShowDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "ShowDetail" {
            let dvc = (segue.destination) as! DetailViewController
            dvc.labelText = "Wow $\(dollarAmount)"
        }
    }
    
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue)
    {}
    
    @IBAction func addNewItem(_sender: UIButton)
    {
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        let indexPath = IndexPath(row: allItems.count-1, section: 0)
        
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    @IBAction func toggleEditingMode(_sender: UIButton)
    {
        if isEditing{
            setEditing(false, animated: true)
            
            _sender.setTitle("Edit", for: .normal)
        }
        else{
            setEditing(true, animated: true)
            
            _sender.setTitle("Done", for: .normal)
        }
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return allItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        let item = allItems[indexPath.row]
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$\(item.valueInDollars)"
        
        return cell
    }
    
}
