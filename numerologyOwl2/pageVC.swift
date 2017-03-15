//
//  pageVC.swift
//  numerologyOwl2
//
//  Created by Reinis Kalnins on 14.03.17.
//  Copyright © 2017. g. Reinis Kalnins. All rights reserved.
//

import UIKit

class pageVC: UIPageViewController, UIPageViewControllerDataSource {

    
    private var _person:Persona!
    
    var person:Persona {
        get {
            return _person
        } set {
            _person = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self
        
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
        
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
    
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */




