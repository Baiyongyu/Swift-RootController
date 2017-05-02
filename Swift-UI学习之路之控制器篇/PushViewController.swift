//
//  PushViewController.swift
//  Swift-UI学习之路之控制器篇
//
//  Created by 宇玄丶 on 2017/4/22.
//  Copyright © 2017年 qianmo. All rights reserved.
//

import UIKit

/*
 从前往后传值
 属性传值一共分为三步:
 1.定义一个要与传值数据类型相同的属性
 2.给属性赋值
 3.取出属性中的值
 
 从后往前传值
 闭包传值:
 1.定义一个闭包属性
 2.在前一个界面为闭包属性赋值
 3.在pop回去之前调用闭包
 
 代理传值
 1.定义协议
 2.定义代理属性
 3.代理对象所在类遵循协议
 4.代理对象所在类遵循协议
 5.代理对象所在类实现协议中的方法
 6.通知代理对象干活
 */

//代理传值1:
protocol PushViewControllerDeleget {
    func sendValue(text:String)
}


class PushViewController: UIViewController {
    
    //属性传值
    var str: String!
    
    //代理传值2:
    var delegate: PushViewControllerDeleget!
    
    
    //闭包传值1：
    var value: ((String) ->())!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(str)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
       
        //代理传值3
        self.delegate.sendValue(text: "代理传值")
        
        //闭包传值3：
        self.value("闭包传值")
        
        
        //通知传值
        //1.使用消息中心发送消息(消息的内容就是要传的值)
        //a.拿到消息中心（单例对象）NotificationCenter.default
        //b.发送消息
        //NSNotification.Name(rawValue:"notifyName") 消息名,Swift3.0之后的写法
        //userInfo:要发送的消息的内容
        NotificationCenter.default.post(name: NSNotification.Name(rawValue:"notifyName"), object: self, userInfo: ["text":"这是一个通知"])
        
        self.navigationController?.popViewController(animated: true)
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
