//
//  CalcViewController.swift
//  MathGameAPP
//
//  Created by 井関竜太郎 on 2021/02/07.
//

import UIKit

class CalcViewController: UIViewController {
    
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    @IBOutlet weak var correctLabel: UILabel!
    
    var answer = 0
    var point = 0
    
    var time = 20
    var timer:Timer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval: 1,target: self,selector: #selector(countTime), userInfo: nil,repeats: true)
        
        
        makeNewQuestion()
        setButtonTitle()
        
        //ボタンを押して話した時。。。
        button1.addTarget(self, action: #selector(onButton(_:)), for: .touchUpInside)
        //ボタンを押して話した時。。。
        button2.addTarget(self, action: #selector(onButton(_:)), for: .touchUpInside)
        //ボタンを押して話した時。。。
        button3.addTarget(self, action: #selector(onButton(_:)), for: .touchUpInside)
        //ボタンを押して話した時。。。
        button4.addTarget(self, action: #selector(onButton(_:)), for: .touchUpInside)
    }
    
    @objc func countTime() {
        time -= 1
        timeLabel.text = "残り\(time)秒"
        if time <= 0 {
            //残りが０になったら、
            timer?.invalidate()
            performSegue(withIdentifier: "next", sender: nil)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! ResultViewController
        nextVC.point = point
    }
    
    
    
    //一斉に表示する。。sender->押されたボタン
    @objc func onButton(_ sender:UIButton) {
        let input = Int(sender.currentTitle!)
        if input == answer {
            //正解だった時
            correctLabel.text = "前回の回答：正解"
            point += 10
        }else{
            //  違っていた時
            correctLabel.text = "前回の回答：不正解"
            point -= 10
            time -= 1
        }
        makeNewQuestion()
        setButtonTitle()
    }
    
    func makeNewQuestion() {
        let num1 = Int.random(in: 0...9)
        let num2 = Int.random(in: 0...9)
        questionLabel.text = "\(num1) + \(num2) = "
        answer = num1 + num2
    }
    
    func setButtonTitle() {
        var answerList = [answer]
        while answerList.count < 4 {
            let randomAnswer = Int.random(in: 0...18)
            if !answerList.contains(randomAnswer) {
                answerList.append(randomAnswer)
            }
        }
        button1.setTitle(String(answerList[0]), for: .normal)
        button2.setTitle(String(answerList[1]), for: .normal)
        button3.setTitle(String(answerList[2]), for: .normal)
        button4.setTitle(String(answerList[3]), for: .normal)
    }
    
    
    
    
    
}
