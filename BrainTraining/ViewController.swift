//
//  ViewController.swift
//  BrainTraining
//
//  Created by Viktor Yamchinov on 29/11/2018.
//  Copyright © 2018 Viktor Yamchinov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var drawView: DrawingImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func numberDrawn(_ image: UIImage) {}

}

