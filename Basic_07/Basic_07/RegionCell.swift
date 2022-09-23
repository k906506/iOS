//
//  RegionCell.swift
//  Basic_07
//
//  Created by 고도 on 2022/09/15.
//

import UIKit

class RegionCell : UITableViewCell {
    @IBOutlet weak var content : UILabel?
    
    func getData(city: RegionItem) {
        content?.text = city.addr
    }
}
