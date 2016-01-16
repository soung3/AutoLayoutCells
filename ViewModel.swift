//
//  ViewModel.swift
//  Autolayout Project
//
//  Created by Peter Soung on 1/16/16.
//  Copyright © 2016 Peter Soung. All rights reserved.
//

import UIKit

class ViewModel: NSObject, UITableViewDelegate, UITableViewDataSource {

    var quotes: [Quote] = []
    
    override init() {
        super.init()
        
        self.loadQuotes()
    }
    
    private func loadQuotes() {
        quotes = []
        if let path = NSBundle.mainBundle().pathForResource("quotes", ofType: "plist"),let quotesArray = NSArray(contentsOfFile: path){
            for dictionary in quotesArray {
                let dictionary = dictionary as! NSDictionary
                let text = dictionary.valueForKey("text") as? String ?? ""
                let imageName = dictionary.valueForKey("imageName") as? String
                let personName = dictionary.valueForKey("person") as? String
                
                let quote = Quote(text: text, imageName: imageName, personName: personName)
                quotes.append(quote)
            }
        }
    }
    
    // TODO: TableView datasource methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(tableViewCellIdentifier, forIndexPath: indexPath) as! TableViewCell
        
        let quote = quotes[indexPath.row]
        cell.quoteLabelText.text = quote.text
        cell.nameLabel.text = quote.personName
        
        if let imageName = quote.imageName where !imageName.isEmpty {
            cell.photoView?.image = UIImage(named: imageName)
            cell.photoWidthConstraint.constant = kDefaultPhotoWidth
            cell.photoRightMarginConstraint.constant = kDefaultPhotoRightMargin
        }
        else {
            cell.photoView?.image = nil
            cell.photoWidthConstraint.constant = 0
            cell.photoRightMarginConstraint.constant = 0
        }
        
        // Inform content cell to re-render the new constraints
        cell.contentView.setNeedsLayout()
        cell.contentView.layoutIfNeeded()
        
        return cell
    }
    
}
