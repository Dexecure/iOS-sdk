//
//  ViewController.swift
//  DexecureExample
//
//  Copyright © 2019 net.Dexecure. All rights reserved.
//

import UIKit
import Dexecure

class ViewController: UIViewController {
   
    var client : Dexecure?

    override func viewDidLoad() {
        super.viewDidLoad()
        client = Dexecure.init(host: "beek.dexecure.net", useHttps: false)
        let imgUrl = client?.buildUrl("/proxy/http://demos.imgix.net/bridge.png", params: [Constants.Key.height : "200"])
        print("IMAGEURL" , imgUrl!)
        // Do any additional setup after loading the view, typically from a nib.
    }


}

