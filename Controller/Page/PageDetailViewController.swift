//
//  PageDetailViewController.swift
//  MyDiary
//
//  Created by Виктор on 14.09.2018.
//  Copyright © 2018 Виктор. All rights reserved.
//

import Foundation
import UIKit

class PageDetailViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pageControll: UIPageControl!
    @IBOutlet weak var registrationBtn: UIButton!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    var index = 0
    
    let currentColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    
    var pageTitle = ""
    var pageSubtitle = ""
    var pageImage: UIImage?
    
    override func viewDidLoad() {
        setViewAndAnimate()
    }
    
    func setViewAndAnimate () {
        
        titleLabel.text = pageTitle
        imageView.image = pageImage
        pageControll.currentPage = index
        subtitleLabel.text = pageSubtitle
       
        titleLabel.textColor = currentColor
        subtitleLabel.textColor = currentColor
       
        
        registrationBtn.setTitleColor(currentColor, for: .normal)
        registrationBtn.layer.borderWidth = 2
        registrationBtn.layer.borderColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        registrationBtn.layer.cornerRadius = 12
        registrationBtn.clipsToBounds = true
        
        registrationBtn.isHidden = (index != 2) ? true: false
        
        
        
    }
    
    @IBAction func registrtion(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "loginViewController") else { return }
        let userDefaults = UserDefaults.standard
        userDefaults.set(true, forKey: "wasIntroWatched")
        userDefaults.synchronize()
        present(vc, animated: true, completion: nil)
        
    }
}
