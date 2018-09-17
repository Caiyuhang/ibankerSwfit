//
//  WelcomeViewController.swift
//  IBankerSwift
//
//  Created by 蔡宇航 on 2018/9/13.
//  Copyright © 2018年 蔡宇航. All rights reserved.
//

import UIKit
import AVKit

class WelcomeViewController: UIViewController {

    fileprivate var player: AVPlayer?
    fileprivate var playerLayer: AVPlayerLayer?
    
    fileprivate lazy var enterMainBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("进入应用", for: .normal)
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 15*SCALE
        btn.layer.borderColor = UIColor.white.cgColor
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20*SCALE)
        btn.addTarget(self, action: #selector(enterMainAction), for: .touchUpInside)
        btn.alpha = 0.0
        return btn
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setUpPlayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
//        setUpPlayer()
        
        addObserver()
        
        playerPlay()
        
        
        //延迟操作
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) { [weak self] in
            //此处有一个问题，在init里面创建播放器，在viewDidLoad创建进入主页按钮，会先创建进入主页按钮，可能是视频layer层渲染慢的问题
            self?.setUpEnterMainBtn()
        }
        
    }

    //
    fileprivate func setUpPlayer() {
        
        //定义一个视频文件路径
        let filePath = Bundle.main.path(forResource: "loginmovie", ofType: "mp4")
        let videoURL = URL(fileURLWithPath: filePath!)
        
        //定义一个视频播放器，通过本地文件路径初始化
        player = AVPlayer(url: videoURL)
        
        //设置大小和位置（全屏）
        playerLayer = AVPlayerLayer(player: player)//显示视频的图层
        playerLayer?.frame = self.view.bounds
        playerLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        
        //添加到界面上
        self.view.layer.addSublayer(playerLayer!)
        
    }
    
    //播放
    fileprivate func playerPlay() {
        //开始播放
        player?.play()
    }
    
    //添加通知
    fileprivate func addObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(playFinish), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
    }
    
    @objc fileprivate func playFinish() {
        enterMainAction()
    }
    
    @objc fileprivate func enterMainAction() {
        player = nil
        
        // TODO: 这里可以做个渐变动画
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        self.willMove(toParentViewController: appDelegate.window?.rootViewController)
        self.removeFromParentViewController()
        view.removeFromSuperview()
    }
    
    fileprivate func setUpEnterMainBtn() {
        view.addSubview(enterMainBtn)
        enterMainBtn.snp.makeConstraints { (make) in
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(280*SCALE)
            make.height.equalTo(45*SCALE)
            make.bottom.equalTo(-100*SCALE)
        }
        
        UIView.animate(withDuration: 2.0) {
            self.enterMainBtn.alpha = 1.0
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

