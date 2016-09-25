//
//  ChatVC.swift
//  ChatViewController
//
//  Created by eugene golovanov on 9/25/16.
//  Copyright © 2016 eugene golovanov. All rights reserved.
//

import UIKit

class ChatVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var bottomLayoutConstraint: NSLayoutConstraint!
    @IBOutlet weak var collectionViewChat: UICollectionView!
    
    let messages = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    
    
    //-----------------------------------------------------------------------------------
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionViewChat.delegate = self
        self.collectionViewChat.dataSource = self
        
    }
    
    //-----------------------------------------------------------------------------------
    // MARK: - keyboard

    
    func keyboardWillShow(notification: NSNotification) {
        self.adjustInsetForKeyboard(show: true, notification: notification)
    }
    
    func keyboardWillHide(notification: NSNotification) {
        self.adjustInsetForKeyboard(show: false, notification: notification)
    }
    
    func adjustInsetForKeyboard(show:Bool, notification: NSNotification) {
        let userinfo = notification.userInfo ?? [:]
        let keyboardFrame = (userinfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let adjustmentHeight = keyboardFrame.height * (show ? 1 : 0)
        
        bottomLayoutConstraint.constant = adjustmentHeight
        self.view.layoutIfNeeded()
//        self.collectionViewChat.layoutIfNeeded()
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }


    
    //-----------------------------------------------------------------------------------
    // MARK: - init deinit
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    deinit {
        
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
