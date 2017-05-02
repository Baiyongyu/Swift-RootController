//
//  MainViewController.swift
//  Swift-UI学习之路之控制器篇
//
//  Created by 宇玄丶 on 2017/4/22.
//  Copyright © 2017年 qianmo. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let home = HomeViewController()
        home.title = "首页"
        let homeVC = UINavigationController.init(rootViewController: home)
        
        
        let shop = ShopCatViewController()
        shop.title = "购物车"
        let shopVC = UINavigationController.init(rootViewController: shop)
        shop.tabBarItem.badgeValue = "99"
        
        let mine = MineViewController()
        mine.title = "个人中心"
        let mineVC = UINavigationController.init(rootViewController: mine)
        
        self.viewControllers = [homeVC, shopVC, mineVC]
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
