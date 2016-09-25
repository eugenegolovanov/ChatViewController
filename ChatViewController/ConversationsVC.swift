//
//  ConversationsVC.swift
//  ChatViewController
//
//  Created by eugene golovanov on 9/24/16.
//  Copyright © 2016 eugene golovanov. All rights reserved.
//

import UIKit

class ConversationsVC: UIViewController {

    @IBOutlet weak var buttonConversations: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func onConversation(_ sender: UIButton) {
        self.performSegue(withIdentifier: "chatSegue", sender: self)
    }

}

