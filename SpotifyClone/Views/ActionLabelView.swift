//
//  ActionLabelView.swift
//  SpotifyClone
//
//  Created by karma on 8/11/22.
//

import UIKit

protocol ActionLabelViewDelegate: AnyObject {
    func actionLabelViewDidTapButton(_ actionView: ActionLabelView)
}

struct ActionLabelViewViewModel {
    let text: String
    let actionTitle: String
}

class ActionLabelView: UIView {
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitleColor(.link, for: .normal)
        return button
    }()

    // MARK: - Properties
    weak var delegate: ActionLabelViewDelegate?
    
    // MARK: - LifeCycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        isHidden = true
        addSubview(label)
        addSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = CGRect(x: 0, y: 0, width: width, height: height-45)
        button.frame = CGRect(x: 0, y: height-40, width: width, height: 40)
    }
    
    func configure(with viewModel: ActionLabelViewViewModel) {
        self.label.text = viewModel.text
        self.button.setTitle(viewModel.actionTitle, for: .normal)
    }
    
    @objc private func didTapButton() {
        delegate?.actionLabelViewDidTapButton(self)
    }
    
}
