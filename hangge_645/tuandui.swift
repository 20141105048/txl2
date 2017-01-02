//
//  tuandui.swift
//  hangge_645
//
//  Created by l20141105048 on 16/12/29.
//  Copyright © 2016年 hangge.com. All rights reserved.
//

import UIKit

class tuandui: UIViewController {
    
    var db:SQLiteDB!
    
    
    @IBOutlet var txtUname: UITextField!
    
    
    @IBOutlet var txtMobile: UITextField!
    
    
    @IBOutlet var email: UITextField!
    
    
    
    @IBOutlet var address: UITextField!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表
        db.execute("create table if not exists lin9(uid integer primary key,uname varchar(20),mobile varchar(20))")
        db.execute("create table if not exists lin10(uid integer primary key,email varchar(20),address varchar(20))")
               db.execute("create table if not exists lin12(uid integer primary key,uname varchar(20),mobile varchar(20))")
        db.execute("create table if not exists lin13(uid integer primary key,email varchar(20),address varchar(20))")
    }
    
    @IBAction func add(sender: AnyObject) {
        saveUser()
        
    }
    
    @IBAction func add1(sender: AnyObject) {
        saveUser1()
        
    }
    
        
    
    
    
    //点击保存
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func saveUser() {
        
        let uname = self.txtUname.text!
        let mobile = self.txtMobile.text!
        
        //插入数据库，这里用到了esc字符编码函数，其实是调用
        
        let sql = "insert into lin9(uname,mobile) values('\(uname)','\(mobile)')"
        print("sql: \(sql)")
        //通过封装的方法执行sql
        let result = db.execute(sql)
        print(result)
        
        let sql2 = "insert into lin12(uname,mobile) values('\(uname)','\(mobile)')"
        print("sql: \(sql2)")
        //通过封装的方法执行sql
        let result2 = db.execute(sql2)
        print(result2)
        
        
    }
    func saveUser1() {
        
        
        let email = self.email.text!
        let address = self.address.text!
        //插入数据库，这里用到了esc字符编码函数，其实是调用
        
        let sql = "insert into lin10(email,address) values('\(email)','\(address)')"
        print("sql: \(sql)")
        //通过封装的方法执行sql
        let result = db.execute(sql)
        print(result)
        
        let sql1 = "insert into lin13(email,address) values('\(email)','\(address)')"
        print("sql: \(sql1)")
        //通过封装的方法执行sql
        let result1 = db.execute(sql1)
        print(result1)
        
    }
    
}
