//
//  ViewController.swift
//  ReactiveSwiftConquer
//
//  Created by The App Experts on 26/03/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var quoteLabel: UILabel!
    private var apis:RestApi?
    private var url:URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        apis = RestApi()
        url = apis?.getURL()
        print("URL > \(url)")
        let q = apis?.fetch(from: url)
        print("Q > \(q)")
    }

    @IBAction func refresh(_ sender: UIButton) {
        let q = apis?.fetch(from: url)
        print("Q > \(q)")
    }
    
}

