//
//  tuanshuang.swift
//  hangge_645
//
//  Created by l20141105048 on 16/12/30.
//  Copyright © 2016年 hangge.com. All rights reserved.
//

import UIKit

class tuanshuang: UIViewController {
    
    var db:SQLiteDB!
    
    @IBOutlet var a1: UITextField!
    
    @IBOutlet var a2: UITextField!
    
    @IBOutlet var b1: UITextField!
    
    @IBOutlet var b2: UITextField!
    
    @IBOutlet var a11: UITextField!
    
    @IBOutlet var a22: UITextField!
    
    @IBOutlet var b11: UITextField!
    
    @IBOutlet var b22: UITextField!
    
    @IBOutlet var q: UITextView!
    
    @IBOutlet var q1: UITextView!
   
    
    
    var temp=0
    var tem=0
    var  te=0
    var t=0
    
    var a=0
    var s=0
    var d=0
    var f=0
    var g=0
    var h=0
    var j=0
    var k=0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表
        db.execute("create table if not exists lin22(uid integer primary key,uname12 varchar(20),uname21 varchar(20),uname112 varchar(20),uname221  varchar(20),dan12 varchar(20),dan21 varchar(20),dan112 varchar(20),dan221 varchar(20),jieguo12 varchar(20),jieguo21 varchar(20))")
        
    }
    @IBAction func z(sender: AnyObject) {
        saveUser()
    }
    
    @IBAction func x(sender: AnyObject) {
        selete()
        
    }
    
    func selete(){
        a1.text=""
        b1.text=""
        let data = db.query("select * from lin102 order by uname1")
        let data1 = db.query("select * from lin103 order by uname11")
        
        //获取最后一行数据显示
        for var x=0;x<data.count;x++
        {
            //获取最后一行数据显示
            let tuser = data[x]
            a1.text! +=   String(tuser["mobile1"]!) + "/" + String(tuser["mobile2"]!)
            a2.text! +=   String(tuser["mobile3"]!)  + "/" + String(tuser["mobile4"]!)
            
        }
        
        let sql = "delete from lin98"
        let result = db.execute(sql)
        print(result)
        
        for var x=0;x<data1.count;x++
        {
            //获取最后一行数据显示
            let tuser1 = data1[x]
            b1.text! +=   String(tuser1["mobile11"]!) + "/" + String(tuser1["mobile22"]!)
            b2.text! +=   String(tuser1["mobile33"]!)  + "/" + String(tuser1["mobile44"]!)
           
            
            
        }
        
        let sql1 = "delete from lin99"
        let result1 = db.execute(sql1)
        print(result1)
        
        
    }
    
    
    @IBAction func add(sender: AnyObject) {
        if(temp==21){
            if(temp>tem+1){
                q.text="甲获胜"
            }
            else{
                temp=temp+1
                a11.text="\(temp)"
                
            }
        }
        else{
            if(temp>20){
                if(temp==tem+1){
                    te=temp+1
                    a11.text="\(te)"
                    q.text="甲获胜"
                }
            }
            
            
            
            temp=temp+1
            a11.text="\(temp)"
            
            
            
            
            
            
            
            
        }
        
        
        
        
    }
    
    
    
    @IBAction func add1(sender: AnyObject) {
        if(tem==21){
            if(tem>temp+1){
                q.text="乙获胜"
            }
            else{
                tem=tem+1
                b11.text="\(tem)"
                
            }
        }
        else{
            if(tem>20){
                if(tem==temp+1){
                    t=tem+1
                    b11.text="\(t)"
                    q.text="乙获胜"
                }
            }
            
            tem=tem+1
            b11.text="\(tem)"
            
            
            
            
            
            
            
            
        }
        
        
        
        
    }
    
    
    @IBAction func add2(sender: AnyObject) {
        if(a==21){
            if(a>s+1){
                q1.text="甲获胜"
            }
            else{
                a=a+1
                a22.text="\(a)"
                
            }
        }
        else{
            if(a>20){
                if(a==s+1){
                    g=a+1
                    a11.text="\(g)"
                    q1.text="甲获胜"
                }
            }
            
            
            
            a=a+1
            a22.text="\(a)"
            
            
            
            
            
            
            
            
        }
        
        
        
        
        
        
        
    }
    
    
    @IBAction func add3(sender: AnyObject) {
        if(s==21){
            if(s>a+1){
                q1.text="乙获胜"
            }
            else{
                s=s+1
                b22.text="\(s)"
                
            }
        }
        else{
            if(s>20){
                if(s==a+1){
                    h=s+1
                    b22.text="\(h)"
                    q1.text="乙获胜"
                }
            }
            
            s=s+1
            b22.text="\(s)"
            
            
            
            
            
            
            
            
        }
        
        
        
        
        
        
        
    }
    
    
    
    //点击保存
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //保存数据到SQLite
    func saveUser() {
        
        let uname12 = self.a1.text!
        let uname21 = self.a2.text!
        
        let uname112 = self.b1.text!
        let uname221 = self.b2.text!
        
        let dan12 = self.a11.text!
        let dan21 = self.a22.text!
        
        let dan112 = self.b11.text!
        let dan221 = self.b22.text!
       
        
        
        
        let jieguo12 = self.q.text!
        let jieguo21 = self.q1.text!
        
        
        //插入数据库，这里用到了esc字符编码函数，其实是调用
        
        let sql = "insert into lin22(uname12,uname21,uname112,uname221,dan12,dan21,dan112,dan221,jieguo12,jieguo21) values('\(uname12)','\(uname21)','\(uname112)','\(uname221)','\(dan12)','\(dan21)','\(dan112)','\(dan221)','\(jieguo12)','\(jieguo21)')"

        print("sql: \(sql)")
        //通过封装的方法执行sql
        let result = db.execute(sql)
        print(result)
        
    }
    
}

