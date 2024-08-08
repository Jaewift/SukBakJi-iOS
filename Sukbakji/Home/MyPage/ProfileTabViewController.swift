//
//  ProfileTabViewController.swift
//  Sukbakji
//
//  Created by jaegu park on 8/3/24.
//

import UIKit
import Tabman
import Pageboy

class ProfileTabViewController: TabmanViewController {
    
    @IBOutlet weak var tabView: UIView!
    
    private var viewControllers: Array<UIViewController> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabMan()
        
        NotificationCenter.default.addObserver(
                  self,
                  selector: #selector(self.didDismissDetailNotification(_:)),
                  name: NSNotification.Name("CannotChangePW"),
                  object: nil
        )
    }
        
    @objc func didDismissDetailNotification(_ notification: Notification) {
        self.scrollToPage(.at(index: 0), animated: true)
    }
    
    private func setupTabMan(){
        let vc1 = UIStoryboard.init(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "EditInfoVC") as! EditInfoViewController
        let vc2 = UIStoryboard.init(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "EditPWVC") as! EditPWViewController
        
        viewControllers.append(vc1)
        viewControllers.append(vc2)
        
        self.dataSource = self
        
        let bar = TMBar.ButtonBar()
        // 배경 회색으로 나옴 -> 하얀색으로 바뀜
        bar.backgroundView.style = .clear
        // 간격 설정
        bar.layout.contentInset = UIEdgeInsets(top: 0, left: 30, bottom: 30, right: 0)
        // 버튼 글씨 커스텀
        bar.buttons.customize { (button) in
            button.tintColor = UIColor(red: 118/255, green: 118/255, blue: 118/255, alpha: 1)
            button.selectedTintColor = UIColor(named: "Coquelicot")
            button.font = UIFont(name: "Pretendard-Medium", size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .bold)
            button.selectedFont = UIFont(name: "Pretendard-SemiBold", size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .bold)
        }

        
        bar.layout.contentMode = .intrinsic
        
        // 밑줄 쳐지는 부분
        bar.indicator.weight = .custom(value: 2)
        bar.indicator.tintColor = UIColor(named: "Coquelicot")
        addBar(bar, dataSource: self, at: .custom(view: tabView, layout: nil))
    }
    
//    override func pageboyViewController(_ pageboyViewController: PageboyViewController, didScrollToPageAt index: PageboyViewController.PageIndex, direction: NavigationDirection, animated: Bool) {
//        if index == 1 { // 두 번째 탭이 선택된 경우
//            guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "PWAlertVC") as? PWAlertViewController else { return }
//            nextVC.modalPresentationStyle = .overCurrentContext
//            
//            DispatchQueue.main.async {
//                self.present(nextVC, animated: false, completion: nil)
//            }
//        }
//    }
}

extension ProfileTabViewController: PageboyViewControllerDataSource, TMBarDataSource {
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        switch index {
        case 0:
            return TMBarItem(title: "회원정보 수정   ")
        case 1:
            return TMBarItem(title: "비밀번호 변경   ")
        default:
            let title = "Page \(index)"
           return TMBarItem(title: title)
        }
    }

    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
}
