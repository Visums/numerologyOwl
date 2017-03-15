//
//  pageVC.swift
//  numerologyOwl2
//
//  Created by Reinis Kalnins on 14.03.17.
//  Copyright © 2017. g. Reinis Kalnins. All rights reserved.
//

import UIKit

class pageVC: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    
    private var _person:Persona!
    
    var person:Persona {
        get {
            return _person
        } set {
            _person = newValue
        }
    }
    
    //weak var pageDelegate: pageVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self
        //delegate = self
        
        if let topItem = self.navigationController?.navigationBar.topItem {
            
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        }
        
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
        
        //pageDelegate?.pageVC(self, didUpdatePageCount: orderedViewControllers.count)
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    
    
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        guard orderedViewControllersCount != nextIndex else {
            return nil
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }

    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.newPersonViewController(person: "Numbers"),
                self.newPersonViewController(person: "Matrix"),
                self.newPersonViewController(person: "Karma"),
                self.newPersonViewController(person: "Periods"),
                self.newPersonViewController(person: "Individual")]
    }()
    
    private func newPersonViewController(person: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil) .
            instantiateViewController(withIdentifier: "person\(person)VC")
    }
    
//    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
//        if let firstViewController = viewControllers?.first,
//            let index = orderedViewControllers.index(of: firstViewController) {
//            pageDelegate?.pageVC(self, didUpdatePageIndex: index)
//    }
    
        
}

//    protocol pageVCDelegate: class {
//        
//        /**
//         Called when the number of pages is updated.
//         
//         - parameter tutorialPageViewController: the TutorialPageViewController instance
//         - parameter count: the total number of pages.
//         */
//        
//        func pageVC(pageVC: pageVC, didUpdatePageCount count: Int)
//        
//        /**
//         Called when the current index is updated.
//         
//         - parameter tutorialPageViewController: the TutorialPageViewController instance
//         - parameter index: the index of the currently visible page.
//         */
//        func pageVC(pageVC: pageVC, didUpdatePageIndex index: Int)
//        
//}




    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */




