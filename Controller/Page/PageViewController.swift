//
//  PageViewController.swift
//  MyDiary
//
//  Created by Виктор on 14.09.2018.
//  Copyright © 2018 Виктор. All rights reserved.
//

import Foundation
import UIKit

class PageViewController: UIPageViewController {
    
    let pageTitles = ["Дни", "Восспоминания", "Жизнь"]
    let pageImage = [#imageLiteral(resourceName: "page_1"), #imageLiteral(resourceName: "page_2"), #imageLiteral(resourceName: "page_3")]
    let subtitles = ["С утра до вечера","В счастье и грусть","Запомни всё"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        
        if let firstVC = displayViewController(atIndex: 0) {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
        
    }
    
    func displayViewController(atIndex index: Int) -> PageDetailViewController? {
        guard index >= 0, index < pageTitles.count,
            let contentVC = storyboard?.instantiateViewController(withIdentifier: "pageDetailViewController") as? PageDetailViewController else { return nil }
        
            contentVC.index = index
            contentVC.pageSubtitle = subtitles[index]
            contentVC.pageTitle = pageTitles[index]
            contentVC.pageImage = pageImage[index]
            return contentVC
        
    }
    
}

extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return displayViewController(atIndex: (viewController as! PageDetailViewController).index - 1)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return displayViewController(atIndex: (viewController as! PageDetailViewController).index + 1)
    }
    
}
