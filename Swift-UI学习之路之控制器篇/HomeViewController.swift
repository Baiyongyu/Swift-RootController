//
//  HomeViewController.swift
//  Swift-UI学习之路之控制器篇
//
//  Created by 宇玄丶 on 2017/4/22.
//  Copyright © 2017年 qianmo. All rights reserved.
//

import UIKit

//视图控制器的生命周期:指的是视图控制器里面的view属性从创建到消失的过程
//代理传值4:遵守协议
class HomeViewController: UIViewController, PushViewControllerDeleget {
    
    var lable = UILabel()
    
    //代理传值5
    func sendValue(text: String) {
        lable.text = text
        print(lable.text!)
    }


    //MARK: - 生命周期
    //注意:重写生命周期相关的方法的时候必须通过super去调用父类的相关方法
    //1.开始创建视图控制器的view的属性的时候会自动调用(创建一个视图控制器只会调用一次)
    override func loadView() {
        super.loadView()
        
        print("创建view")
    }
    
    
    //2.每次view将要出现的时候会调用(可能会被调用多次)
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view将要出现")
    }
    
    //3.每次view已经出现的时候会调用(可能会被调用多次)
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view已经出现")
    }
    
    //4.view属性已经加载完成之后会自动调用（创建一个视图控制器只会调用一次）
    //一般在这个方法中去搭建当前视图控制器对应的界面
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "首页"
        //设置导航栏背景颜色
        self.navigationController?.navigationBar.barTintColor = UIColor.green
        self.view.backgroundColor = UIColor.red

        print("view加载完成")
        
        //2.注册成为观察者
        //参数1:观察者对象
        //参数2:消息中心发送消息的时候观察者会自动调用的方法对应的selector（观察者接收到消息后会调用的方法）-->必须带一个参数，并且参数的类型是NSNotification
        //参数3:观察者要观察的消息的名字
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "notifyName"), object: nil, queue: OperationQueue.main) { (note) in
            //这里拿到通知传来的数据text,然后进行逻辑处理,  我们这里只是打印传过来的内容
            print("\(String(describing: note.userInfo?["text"])))")
        }
        
        /*
            用这种写法注册观察者总是蹦，而且官方也没有介绍使用这种方法，不过这样也好，相比正确的使用方法免去了函数，直接用一个闭包就可以了。
        NotificationCenter.default.addObserver(self, selector: Selector(("notificationAction:")), name: NSNotification.Name(rawValue: "notifyName"), object: nil)

        func notificationAction(notice:NSNotification) {
            print("收到通知==\(String(describing: notice.userInfo))")
        }
        */
        
    }
    
    //5.每次view将要消失的时候会调用(可能会被调用多次)
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view将要消失")
    }
    
    //6.每次view已经消失的时候会调用(可能会被调用多次)
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view已经消失")
    }
    
    //接收到内存警告的时候自动调用
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let pushVC = PushViewController()
        pushVC.str = "属性传值"
        
        //闭包传值2：
        pushVC.value = {
            (text: String) in
            // 取出参数，为前一个界面的赋值
            self.lable.text = text;
            print(self.lable.text!)
        }
        
        pushVC.delegate = self
        
        self.navigationController?.pushViewController(pushVC, animated: true)
        
//        self.navigationController?.present(PushViewController(), animated: true, completion: { 
//            
//        })
    }

    //移除通知
    deinit {
        NotificationCenter.default.removeObserver(self)
//        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "notifyName"), object: nil)
    }
}
