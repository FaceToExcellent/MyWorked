//
//  gifViewController.swift
//  MyWorked
//
//  Created by HYZ on 16/7/5.
//  Copyright © 2016年 HYZ. All rights reserved.
//



class gifViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      Demo2()
      makelabel()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
    func Demo2(){
        
//    let image = UIImage(named: "11")
//    let imageview = UIImageView(image: image)
//        imageview.frame=CGRectMake(0, 0, 200, 200)
//        imageview.center = self.view.center;
//        self.view.addSubview(imageview)
        
      
        
        
       
        
        //咋用不了呢   全都是 pod 妈的让我杂用
        let manager = JWAnimationManager(memoryLimit:20)
        
        let url = NSBundle.mainBundle().URLForResource("test", withExtension: "gif")!
        let imageData = NSData(contentsOfURL:url)
        
        let image = UIImage(animatedImage:imageData!)
        let imageview = UIImageView(animatedImage: image, manager:manager,loopTime: -1)
        imageview.frame = CGRect(x: 7.0, y: 50.0, width: 400.0, height: 224.0)
        view.addSubview(imageview)
    }

    
    func makelabel(){
        
        let label = UILabel()
        label.frame = CGRectMake(10, 250, self.view.frame.size.width-20, 300)
        label.numberOfLines = 0;
        label.textColor = UIColor.blueColor()
        label.font = UIFont.systemFontOfSize(15)
        label.text = "其实根本不用pod 只要把JWAnimatedImage文件夹拖进来，再导入 imageIO.framework就可以了"
        self.view.addSubview(label)
        
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
