//
//  NavigationController.swift
//  SWFrame
//
//  Created by 杨建祥 on 2020/4/7.
//

import UIKit
import HBDNavigationBar

open class NavigationController: UINavigationController /*HBDNavigationController*/ {
        
    open override var shouldAutorotate: Bool {
        return (self.topViewController?.shouldAutorotate)!
    }
        
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return (self.topViewController?.supportedInterfaceOrientations)!
    }
    
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return (self.topViewController?.preferredStatusBarStyle)!
    }

}

