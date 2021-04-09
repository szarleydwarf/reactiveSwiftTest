//
//  ViewController.swift
//  ReactiveSwiftConquer
//
//  Created by The App Experts on 26/03/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let apis = RestApi()
        let url = apis.getURL()
        print("URL > \(url)")
        let q = apis.fetch(from: url)
        print("Q > \(q)")
    }


}

