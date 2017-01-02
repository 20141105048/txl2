//
//  tuanxiang.swift
//  hangge_645
//
//  Created by l20141105048 on 16/12/29.
//  Copyright © 2016年 hangge.com. All rights reserved.
//

import UIKit

class tuanxiang: UIViewController {
    var db:SQLiteDB!
    
    
    @IBOutlet var q: UITextField!
    
    @IBOutlet var w: UITextField!
    
    @IBOutlet var r: UITextView!
    
    @IBOutlet var e: UITextView!
    
    @IBOutlet var a: UITextField!
    
    @IBOutlet var b1: UITextField!
    
    @IBOutlet var b3: UITextField!
    @IBOutlet var b2: UITextField!
    
    @IBOutlet var b4: UITextField!
    
    var temp=0
    var tem=0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        db = SQLiteDB.sharedInstance()
        db.execute("create table if not exists lin9(uid integer primary key,uname varchar(20),mobile varchar(20))")
    
    db.execute("create table if not exists lin98(uid integer primary key,name1 varchar(20),name2 varchar(20),uname1 varchar(20),uname2 varchar(20),uname3 varchar(20),mobile1 varchar(20),mobile2 varchar(20),mobile3 varchar(20),mobile4 varchar(20))")
        db.execute("create table if not exists lin102(uid integer primary key,name1 varchar(20),name2 varchar(20),uname1 varchar(20),uname2 varchar(20),uname3 varchar(20),mobile1 varchar(20),mobile2 varchar(20),mobile3 varchar(20),mobile4 varchar(20))")
        
    
    }
    @IBAction func add(sender: AnyObject) {
        
         selete()
        
    }
    
    func selete(){
        e.text=""
        r.text=""
        let data = db.query("select * from lin9 order by uname")
        
        for var x=0;x<data.count;x++
        {
            //获取最后一行数据显示
            let tuser = data[x]
            e.text! +=   String(tuser["uname"]!)
            r.text! +=   String(tuser["mobile"]!)        }
        
        let sql = "delete from lin9"
        let result = db.execute(sql)
        print(result)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func add6(sender: AnyObject) {
        saveUser()
    }
    
    //保存数据到SQLite
    func saveUser() {
        let name1 = self.e.text!
        let name2 = self.r.text!
        
        let uname1 = self.q.text!
        let uname2 = self.w.text!
        let uname3 = self.a.text!
        
        
        let mobile1 = self.b1.text!
        let mobile2 = self.b2.text!
        let mobile3 = self.b3.text!
        let mobile4 = self.b4.text!
          //插入数据库，这里用到了esc字符编码函数，其实是调用
        
        
        let sql = "insert into lin98(name1,name2,uname1,uname2,uname3,mobile1,mobile2,mobile3,mobile4) values('\(name1)','\(name2)','\(uname1)','\(uname2)','\(uname3)','\(mobile1)','\(mobile2)','\(mobile3)','\(mobile4)')"

        print("sql: \(sql)")
        //通过封装的方法执行sql
        let result = db.execute(sql)
        print(result)
        
        let sql1 = "insert into lin102(name1,name2,uname1,uname2,uname3,mobile1,mobile2,mobile3,mobile4) values('\(name1)','\(name2)','\(uname1)','\(uname2)','\(uname3)','\(mobile1)','\(mobile2)','\(mobile3)','\(mobile4)')"
        
        print("sql: \(sql1)")
        //通过封装的方法执行sql
        let result1 = db.execute(sql1)
        print(result1)
        
        
    }
    
    
}

