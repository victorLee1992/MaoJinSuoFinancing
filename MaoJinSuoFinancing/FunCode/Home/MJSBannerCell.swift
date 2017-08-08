//
//  MJSBannerCell.swift
//  MaoJinSuoFinancing
//
//  Created by lixiong on 2017/8/7.
//  Copyright © 2017年 ChiFu. All rights reserved.
//

import UIKit
import SnapKit

typealias urlDetailClosure = (String , String) -> Void

class MJSBannerCell: MJSTableViewCell {

    var deImageView : UIImageView?
    var cell_height : CGFloat?
    var dataList : [MJSBannerData]?
    
    var theAction : urlDetailClosure?
    var selectIndex : Int?{
        
        didSet{
            if selectIndex != 0 {
                pageControl.currentPage = selectIndex! - 1
            }
            else{
                pageControl.currentPage = dataList!.count - 1
            }
        }
    }
    var timer :Timer?
    
    
    
    lazy var uiScrollView : UIScrollView = { [unowned self] in
       
        let scrollView : UIScrollView = UIScrollView()
        scrollView.delegate = self
        scrollView.alwaysBounceVertical = true
        scrollView.alwaysBounceVertical = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.isPagingEnabled = true
        return scrollView
    }()
    
    lazy var pageControl : UIPageControl = {
       
        let control : UIPageControl = UIPageControl()
        control.hidesForSinglePage = true
        control.center.x = self.center.x
        return control
    }()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(uiScrollView)
        self.contentView.addSubview(pageControl)
        
        cell_height = self.bounds.size.height
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

extension MJSBannerCell{
    
    func layout() -> Void {
        
        uiScrollView.snp.makeConstraints { (make) in
        
            make.top.left.right.bottom.equalToSuperview()
        }
        
        pageControl.snp.makeConstraints { (make) in
            
            make.left.width.equalToSuperview()
            make.bottom.equalTo(-10)
            make.height.equalTo(20)
        }
    }
    
}


// MARK: 设置数据
extension MJSBannerCell{
    
    func setDefault() -> Void {
        
        deImageView = UIImageView(frame: uiScrollView.frame)
        deImageView?.image = UIImage(named: "i_banner_default.png")
        uiScrollView.addSubview(deImageView!)
    }
    
    func setData( data : [MJSBannerData]?) -> Void {
        
        dataList = data
        guard data != nil else {
            return
        }
        
        self.layout()
        
        self.addTimer()
        pageControl.numberOfPages = (data?.count)!
        deImageView?.removeFromSuperview()
        
        let finalDataArr : NSMutableArray = (data! as NSArray).mutableCopy() as! NSMutableArray
        finalDataArr.insert(data!.last!, at: 0)
        finalDataArr.add(data!.first!)
        uiScrollView.contentSize = CGSize(width: kScreenW * CGFloat(finalDataArr.count), height: cell_height!)
        
        
        for index : Int in 0..<finalDataArr.count {
    
            let temp : MJSBannerData = finalDataArr.object(at: index) as! MJSBannerData
            
            let imageView : UIImageView = UIImageView(frame: CGRect(x: kScreenW  * CGFloat(index), y: 0, width: kScreenW, height: cell_height!))
            imageView.isUserInteractionEnabled = true
            
            let data :Data = try! Data(contentsOf: URL(string: temp.picUrl!)!)
            
            imageView.image = UIImage(data: data)
            uiScrollView.addSubview(imageView)
            
            let tapGesture : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(clickAction(data:)))
            imageView.addGestureRecognizer(tapGesture)
        }
        // 初始时  在第二张的位置
        uiScrollView.setContentOffset(CGPoint(x : kScreenW ,y : 0) , animated: false)
    }
    
    
    func clickAction(data : MJSBannerData) -> Void {
        
        if (theAction != nil) {
            
            theAction!("" ,"")
        }
    }
    
    func addTimer() -> Void {
        
        guard timer != nil else {
            return
        }
        
        timer = Timer(timeInterval: 2, repeats: true, block: { (timer) in
            
            let offSet : CGPoint = self.uiScrollView.contentOffset
            self.uiScrollView.scrollRectToVisible( CGRect.init(x: offSet.x + kScreenW, y: 0, width: kScreenW, height: self.cell_height!)  , animated: true)
            
            print("这是  = %f= 页", offSet.x)
        })
    }
    
}


extension MJSBannerCell :UIScrollViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        
        let offSet : CGPoint = scrollView.contentOffset
        var rect : CGRect = uiScrollView.bounds
        
        if offSet.x == CGFloat((dataList?.count)! + 1) * kScreenW {
            rect.origin.x = kScreenW
        }
        else if offSet.x == 0 {
            rect.origin.x = CGFloat((dataList?.count)!) * kScreenW
        }
        uiScrollView.scrollRectToVisible(rect, animated: false)
        
        self.selectIndex = Int(offSet.x / kScreenW)
    }
    
}
