//
//  MenuCustomView.swift
//  EzFeeds
//
//  Created by Nam on 05/04/2021.
//

import UIKit

class MenuCustomView: BaseCustomView {

    @IBOutlet weak var menuTableView: UITableView!
    
    var parentView: UIView?
    var menu = [(title: String,image: String)]()
    
    var widthMenu: CGFloat = 150
    var heigthMenu: CGFloat = 45
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configUI()
        configMenu()
        configTableView()
    }
    
    func configUI() {
        self.addShadow(color: .darkGray)
    }
    
    func configTableView() {
        menuTableView.register(cellType: MenuTableViewCell.self, bundle: nil)
        menuTableView.delegate = self
        menuTableView.dataSource = self
    }
    
    func configMenu() {
        menu.append(("Read later","icon_bookmark_black"))
        menuTableView.reloadData()
    }
    
    func show() {
        guard let superView = parentView else { return }
        superView.clipsToBounds = false
        self.tag = 123
        self.frame = CGRect(x: -widthMenu + superView.bounds.width, y: superView.bounds.height, width: widthMenu, height: heigthMenu * CGFloat(menu.count))
        self.isUserInteractionEnabled = true
        self.alpha = 0
        superView.addSubview(self)
        UIView.animate(withDuration: 0.2) {
            self.alpha = 1
        }
    }
    
    
    func hide(){
        if let viewWithTag = self.viewWithTag(123) {
            UIView.animate(withDuration: 0.2) {
                self.alpha = 0
            } completion: { (view) in
                viewWithTag.removeFromSuperview()
            }
        }
    }

}

extension MenuCustomView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: MenuTableViewCell.self, for: indexPath) as MenuTableViewCell
        cell.config(image: menu[indexPath.row].image, title: menu[indexPath.row].title)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        menuTableView.deselectRow(at: indexPath, animated: true)
    }
    
}
