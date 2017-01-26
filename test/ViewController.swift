import UIKit
import SnapKit

extension Array {
    mutating func shuffle(count: Int) {
        for _ in 0..<count {
            self.sort { _,_ in arc4random() < arc4random() }
        }
    }
}

class ViewController: UIViewController {
    
    let englishLabel = UILabel()
    let japanLabel = UILabel()
    let btn = UIButton()
    let backBtn = UIButton()
    var ary: [String] = ["He is","excited","to start","his new life","in this city"]
    var beforeString: String = ""
    var afterString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for index in 0..<ary.count {
            if index == 0 {
                beforeString += ary[index]
            } else {
                beforeString += " " + ary[index]
            }
        }
        
        // 英文
        englishLabel.text = beforeString
        englishLabel.numberOfLines = 0
        self.view.addSubview(englishLabel)
        englishLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(50)
            make.left.equalTo(20)
            make.width.equalTo(275)
        }
        // 和文
        japanLabel.text = beforeString
        japanLabel.numberOfLines = 0
        japanLabel.text = "彼はこの都市で新たな生活を始めることに興奮している"
        self.view.addSubview(japanLabel)
        japanLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(100)
            make.left.equalTo(20)
            make.width.equalTo(275)
        }
        
        // 変換ボタン
        btn.setTitle("変換", for: .normal)
        btn.backgroundColor = UIColor.red
        self.view.addSubview(btn)
        btn.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(200)
            make.left.equalTo(20)
            make.width.equalTo(275)
        }
        btn.addTarget(self, action: #selector(ViewController.onClickBtn(sender:)), for: .touchUpInside)
        
        // 戻すボタン
        backBtn.setTitle("元に戻す", for: .normal)
        backBtn.backgroundColor = UIColor.green
        self.view.addSubview(backBtn)
        backBtn.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(240)
            make.left.equalTo(20)
            make.width.equalTo(275)
        }
        backBtn.addTarget(self, action: #selector(ViewController.onClickBackBtn(sender:)), for: .touchUpInside)
    }
    
    internal func onClickBtn(sender: UIButton) {
        
        englishLabel.text = ""
        afterString = ""
        
        ary.shuffle( count: ary.count )
        for index in 0..<ary.count {
            if index == 0 {
                afterString += ary[index]
            } else {
                afterString += " " + ary[index]
            }
        }
        
        englishLabel.text = afterString
        
    }
    
    internal func onClickBackBtn(sender: UIButton) {
        
        englishLabel.text = ""
        englishLabel.text = beforeString
        
    }
}



