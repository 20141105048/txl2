//
//  tuandan.swift
//  hangge_645
//
//  Created by l20141105048 on 16/12/30.
//  Copyright © 2016年 hangge.com. All rights reserved.
//

import UIKit

class tuandan: UIViewController {
    
    var db:SQLiteDB!
    @IBOutlet var a1: UITextField!
    
    @IBOutlet var a11: UITextField!
    @IBOutlet var b1: UITextField!
    
    @IBOutlet var b11: UITextField!
    @IBOutlet var a2: UITextField!
    
    @IBOutlet var a22: UITextField!
    @IBOutlet var b2: UITextField!
    
    @IBOutlet var b22: UITextField!
    @IBOutlet var a3: UITextField!
    
    @IBOutlet var a33: UITextField!
    @IBOutlet var b3: UITextField!
    
    @IBOutlet var b33: UITextField!
    @IBOutlet var q: UITextView!
    
    @IBOutlet var q1: UITextView!
    
    @IBOutlet var q2: UITextView!
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
        db.execute("create table if not exists lin20(uid integer primary key,uname1 varchar(20),uname2 varchar(20),uname3 varchar(20),uname11 varchar(20),uname22 varchar(20),uname33 varchar(20),dan1 varchar(20),dan2 varchar(20),dan3 varchar(20),dan11 varchar(20),dan22 varchar(20),dan33 varchar(20),jieguo1 varchar(20),jieguo2 varchar(20),jieguo3 varchar(20))")
        
    }
    @IBAction func qwe(sender: AnyObject) {
        
        saveUser()
        
        
    }
    @IBAction func qw(sender: AnyObject) {
        selete()
    }
    
    func selete(){
        a1.text=""
        b1.text=""
        let data = db.query("select * from lin98 order by uname1")
        let data1 = db.query("select * from lin99 order by uname11")
        
        //获取最后一行数据显示
        for var x=0;x<data.count;x++
        {
            //获取最后一行数据显示
            let tuser = data[x]
            a1.text! +=   String(tuser["uname1"]!)
            a2.text! +=   String(tuser["uname2"]!)
            a3.text! +=   String(tuser["uname3"]!)
            
        }
        
        let sql = "delete from lin98"
        let result = db.execute(sql)
        print(result)
        
        for var x=0;x<data1.count;x++
        {
            //获取最后一行数据显示
            let tuser1 = data1[x]
            b1.text! +=   String(tuser1["uname11"]!)
            b2.text! +=   String(tuser1["uname22"]!)
            b3.text! +=   String(tuser1["uname33"]!)
        
        
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
    
    @IBAction func add4(sender: AnyObject) {
        if(temp==21){
            if(d>f+1){
                q2.text="甲获胜"
            }
            else{
                d=d+1
                a33.text="\(d)"
                
            }
        }
        else{
            if(d>20){
                if(d==f+1){
                    j=d+1
                    a33.text="\(j)"
                    q2.text="甲获胜"
                }
            }
            
            
            
            d=d+1
            a33.text="\(d)"
            
            
            
            
            
            
            
            
        }
        
        
        
        
    }
    
    
    @IBAction func add5(sender: AnyObject) {
        
        if(f==21){
            if(f>d+1){
                q2.text="乙获胜"
            }
            else{
                f=f+1
                b33.text="\(f)"
                
            }
        }
        else{
            if(f>20){
                if(f==d+1){
                    k=f+1
                    b33.text="\(k)"
                    q2.text="乙获胜"
                }
            }
            
            f=f+1
            b33.text="\(f)"
            
            
            
            
            
            
            
            
        }
        
        
 
        
    }
    
    
    
    
    
           //点击保存
    
       override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //保存数据到SQLite
    func saveUser() {
        
        let uname1 = self.a1.text!
        let uname2 = self.a2.text!
        let uname3 = self.a3.text!
        let uname11 = self.b1.text!
        let uname22 = self.b2.text!
        let uname33 = self.b3.text!
        let dan1 = self.a11.text!
        let dan2 = self.a22.text!
        let dan3 = self.a33.text!
        let dan11 = self.b11.text!
        let dan22 = self.b22.text!
        let dan33 = self.b33.text!
        
        
        
        let jieguo1 = self.q.text!
        let jieguo2 = self.q1.text!
        let jieguo3 = self.q2.text!
        
        
        //插入数据库，这里用到了esc字符编码函数，其实是调用
        
        let sql = "insert into lin20(uname1,uname2,uname3,uname11,uname22,uname33,dan1,dan2,dan3,dan11,dan22,dan33,jieguo1,jieguo2,jieguo3) values('\(uname1)','\(uname2)','\(uname3)','\(uname11)','\(uname22)','\(uname33)','\(dan1)','\(dan2)','\(dan3)','\(dan11)','\(dan22)','\(dan33)','\(jieguo1)','\(jieguo2)','\(jieguo3)')"
        print("sql: \(sql)")
        //通过封装的方法执行sql
        let result = db.execute(sql)
        print(result)
        
    }
    
}
