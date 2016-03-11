//
//  FirstViewController.swift
//  To Do List
//
//  Created by Alex Retter on 3/11/2016.
//  Copyright (c) 2015 Alex Retter. All rights reserved.
//

import UIKit

var objects = [String]()

class FirstViewController: UIViewController, UITableViewDelegate {
    
    
    
    @IBOutlet weak var objectTable: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if NSUserDefaults.standardUserDefaults().objectForKey("objects") != nil {
        
            objects = NSUserDefaults.standardUserDefaults().objectForKey("objects") as! [String]
        
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return objects.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = objects[indexPath.row]
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            
            objects.removeAtIndex(indexPath.row)
            
            NSUserDefaults.standardUserDefaults().setObject(objects, forKey: "objects")
            
            objectTable.reloadData()
        }
        
    
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        objectTable.reloadData()
        
    }
    
    @IBAction func shuffleTable(sender: AnyObject) {
    
            objects.shuffleInPlace()
            objects.shuffle()
        }
        
    }
    

extension CollectionType {
    func shuffle() -> [Generator.Element] {
        var list = Array(self)
        list.shuffleInPlace()
        return list
    }
}

extension MutableCollectionType where Index == Int {
    mutating func shuffleInPlace() {
        if count < 2 { return }
        
        for i in 0..<count - 1 {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            guard i != j else { continue }
            swap(&self[i], &self[j])
        }
    }
}




