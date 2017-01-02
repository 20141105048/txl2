import UIKit

class ViewController: UIViewController {
    
    var db:SQLiteDB!
    
    @IBOutlet var txtUname: UITextField!
    @IBOutlet var txtMobile: UITextField!
    
    @IBOutlet var q: UITextView!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var address: UITextField!
     var temp=0
     var tem=0
    var  te=0
    var t=0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表
        db.execute("create table if not exists lin(uid integer primary key,uname varchar(20),mobile varchar(20),email varchar(20),address varchar(20),jieguo varchar(20))")
       
    }
    
    @IBAction func add(sender: AnyObject) {
        
        if(temp==21){
            if(temp>tem+1){
                q.text="甲获胜"
            }
            else{
                temp=temp+1
                email.text="\(temp)"
                
            }
        }
        else{
            if(temp>20){
                if(temp==tem+1){
                    te=temp+1
                    email.text="\(te)"
                    q.text="甲获胜"
                }
            }
            
            
            
                temp=temp+1
                email.text="\(temp)"
            
            
            
            
            
            
            
            
        }
        
        
        
            
            
            
            
        
        
       
        
    }
    @IBAction func add1(sender: AnyObject) {
        
        if(tem==21){
            if(tem>temp+1){
                q.text="乙获胜"
            }
            else{
                tem=tem+1
                address.text="\(tem)"
                
            }
        }
        else{
            if(tem>20){
                if(tem==temp+1){
                    t=tem+1
                    address.text="\(t)"
                    q.text="乙获胜"
                }
            }
            
                tem=tem+1
                address.text="\(tem)"
            
            
           
            
            
            
            
            
        }
        
        
      
       
    }
    //点击保存

    @IBAction func saveClicked(sender: AnyObject) {
        saveUser()
    }
      override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //保存数据到SQLite
    func saveUser() {
        
        let uname = self.txtUname.text!
        let mobile = self.txtMobile.text!
        let email = self.email.text!
        let address = self.address.text!
        let jieguo = self.q.text!        //插入数据库，这里用到了esc字符编码函数，其实是调用 
    
        let sql = "insert into lin(uname,mobile,email,address,jieguo) values('\(uname)','\(mobile)','\(email)','\(address)','\(jieguo)')"
        print("sql: \(sql)")
        //通过封装的方法执行sql
        let result = db.execute(sql)
        print(result)
        
    }
    
   }