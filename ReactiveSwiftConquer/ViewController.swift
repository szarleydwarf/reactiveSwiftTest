//
//  ViewController.swift
//  ReactiveSwiftConquer
//
//  Created by The App Experts on 26/03/2021.
//
import Combine
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var quoteLabel: UILabel!
    private var apis:RestApi?
    private var observer:AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        apis = RestApi()
        callApi()
        print("Q > \(observer.debugDescription)")
    }
    
    @IBAction func refresh(_ sender: UIButton) {
        callApi()
    }
    
    func callApi() {
        let url = apis?.getURL()
        print("URL > \(url)")
        observer = apis?.fetch(from: url)
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .finished:
                    print("done done done")
                case .failure(let e):
                    print("Error > \(e.localizedDescription)")
                }
            }, receiveValue: { [weak self] model in
                print("Q > \(model)")
                self?.refreshUI(with: model)
            })
    }
    
    func refreshUI(with model:AQuote) {
        authorLabel.text = model.quoteAuthor
        quoteLabel.text = model.quoteText
    }

}

