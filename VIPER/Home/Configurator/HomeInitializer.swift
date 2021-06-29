//
//  HomeHomeInitializer.swift
//  VIPER
//
//  Created by Magzhan on 03/06/2021.
//  Copyright © 2021 Magzhan. All rights reserved.
//

import UIKit

class HomeModuleInitializer: NSObject {

    func viewController() -> UIViewController{
        let storyboard = UIStoryboard(name: "Home", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        let configurator = HomeModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: vc)
        
        return vc
    }

}
