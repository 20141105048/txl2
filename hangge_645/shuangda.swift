//
//  shuangda.swift
//  hangge_645
//
//  Created by l20141105048 on 16/12/21.
//  Copyright © 2016年 hangge.com. All rights reserved.
//

import UIKit

class shuangda: UIViewController {
    
    var db:SQLiteDB!
    
    
  
    
    @IBOutlet var a2: UITextField!
    @IBOutlet var a1: UITextField!
   
    @IBOutlet var a3: UITextField!
    @IBOutlet var q: UITextView!
    @IBOutlet var b2: UITextField!
    @IBOutlet var b1: UITextField!
    @IBOutlet var a4: UITextField!
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var address: UITextField!
    var temp=0
    var tem=0
    var t=0
    var  te=0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表
        db.execute("create table if not exists lin1(uid integer primary key,uname varchar(20),uname2 varchar(20),mobile varchar(20),mobile2 varchar(20),email varchar(20),address varchar(20),jieguo varchar(20))")
        
    }
    @IBAction func a2(sender: AnyObject) {
        if(temp==21){
            if(temp>tem+1){
                q.text="甲获胜"
            }
            else{
                temp=temp+1
                b1.text="\(temp)"
                
            }
        }
        else{
            if(temp>20){
                if(temp==tem+1){
                    te=temp+1
                    b1.text="\(te)"
                    q.text="甲获胜"
                }
            }
            
            temp=temp+1
            b1.text="\(temp)"
            
            
            
            
            
        }
        

    }

    @IBAction func a3(sender: AnyObject) {
        if(tem==21){
            if(tem>temp+1){
                q.text="乙获胜"
            }
            else{
                tem=tem+1
                b2.text="\(tem)"
                
            }
        }
        else{
            if(tem>20){
                if(tem==temp+1){
                    t=tem+1
                    b2.text="\(t)"
                    q.text="乙获胜"
                }
            }
            
            tem=tem+1
            b2.text="\(tem)"
            
            
            
            
            
        }
        

    }
   
    @IBAction func saveClicked(sender: AnyObject) {
        
        saveUser()
    }
    
            //点击保存
    
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //保存数据到SQLite
    func saveUser() {
        if(tem>temp){
            q.text="乙获胜"
            
        }
        
        if(temp>tem){
            
            q.text="甲获胜"
            
        }
        
         let uname = self.a1.text!
        
         let uname2 = self.a2.text!
         let mobile = self.a3.text!
         let mobile2 = self.a4.text!
        let email = self.b1.text!
        let address = self.b2.text!
        let jieguo = self.q.text!        //插入数据库，这里用到了esc字符编码函数，其实是调用
        
        let sql = "insert into lin1(uname,uname2,mobile,mobile2,email,address,jieguo) values('\(uname)','\(uname2)','\(mobile)','\(mobile2)','\(email)','\(address)','\(jieguo)')"
        print("sql: \(sql)")
        //通过封装的方法执行sql
        let result = db.execute(sql)
        print(result)
        
    }



}
