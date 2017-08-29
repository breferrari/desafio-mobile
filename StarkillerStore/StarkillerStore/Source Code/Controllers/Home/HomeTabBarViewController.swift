import UIKit

class HomeTabBarViewController: BaseTabBarViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStarkillerStoreTitle()
    }
    
    private func setStarkillerStoreTitle() {
        
        let regularAttributes = [
            NSFontAttributeName : UIFont.systemFont(ofSize: 17, weight: UIFontWeightRegular),
            NSForegroundColorAttributeName : UIColor.white ]
        
        let boldAttributes = [
            NSFontAttributeName : UIFont.systemFont(ofSize: 17, weight: UIFontWeightBold),
            NSForegroundColorAttributeName : UIColor.white ]
        
        let formattedString = NSMutableAttributedString(string: "StarkillerStore", attributes: boldAttributes)
        formattedString.addAttributes(regularAttributes, range: NSRange(location: 0, length: 10))
        
        let navLabel = UILabel()
        navLabel.attributedText = formattedString
        navLabel.sizeToFit()
        navLabel.layer.shadowColor = UIColor.red.cgColor
        navLabel.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        navLabel.layer.shadowRadius = 5.0
        navLabel.layer.shadowOpacity = 0.9
        navLabel.layer.masksToBounds = false
        navigationItem.titleView = navLabel
        
    }

}
