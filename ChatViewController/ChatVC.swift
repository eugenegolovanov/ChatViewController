//
//  ChatVC.swift
//  ChatViewController
//
//  Created by eugene golovanov on 9/25/16.
//  Copyright © 2016 eugene golovanov. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {

    
    @IBOutlet weak var collectionViewChat: UICollectionView!
    
    let messages = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionViewChat.delegate = self
        self.collectionViewChat.dataSource = self
        
    }



}


extension ChatVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.messages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "chatCell", for: indexPath) as! ChatCell
        let message = self.messages[indexPath.item]
        cell.textLabel.text = message
        return cell
    }
    
}
