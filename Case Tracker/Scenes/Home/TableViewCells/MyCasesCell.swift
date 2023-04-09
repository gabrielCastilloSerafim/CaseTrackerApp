//
//  MyCasesCell.swift
//  Case Tracker
//
//  Created by Gabriel Castillo Serafim on 7/4/23.
//

import UIKit

final class MyCasesCell: UITableViewCell {
    
    public static let identifier = "MyCasesTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupContentView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(
        title: String?,
        trackingId: String?,
        statusDetails: String?,
        lastUpdated: String?,
        style: ActivityStatus?)
    {   
        titleLabel.text = title
        trackingIdLabel.text = trackingId
        statusDetailsLabel.text = statusDetails
        lastUpdatedLabel.text = lastUpdated
        
        switch style {
            
        case .approved:
            activityCircle.backgroundColor = .green
            
        case .pending:
            activityCircle.backgroundColor = .yellow
            
        case .rejected:
            activityCircle.backgroundColor = .red
            
        default:
            break
        }
    
    }
    
    public lazy var separator: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    public lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 19, weight: .bold)
        return label
    }()
    
    public lazy var trackingIdTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 13, weight: .semibold)
        label.text = "Tracking Id:"
        return label
    }()
    
    public lazy var trackingIdLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.text = "ufh45h46h66oo322h5o"
        return label
    }()
    
    public lazy var statusDetailsTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 13, weight: .semibold)
        label.text = "Status details:"
        return label
    }()
    
    public lazy var statusDetailsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.text = "Waiting for additional documentation"
        return label
    }()
    
    public lazy var lastUpdatedTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 13, weight: .semibold)
        label.text = "Last updated:"
        return label
    }()
    
    public lazy var lastUpdatedLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.text = "12/02/2023"
        return label
    }()
    
    public lazy var activityCircle: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 3
        view.layer.masksToBounds = true
        return view
    }()
    
    public lazy var arrowAccessoryView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = .white
        return imageView
    }()
    
    private func setupContentView() {
        
        contentView.addSubview(separator)
        contentView.addSubview(titleLabel)
        contentView.addSubview(activityCircle)
        contentView.addSubview(trackingIdTitleLabel)
        contentView.addSubview(trackingIdLabel)
        contentView.addSubview(statusDetailsTitleLabel)
        contentView.addSubview(statusDetailsLabel)
        contentView.addSubview(lastUpdatedTitleLabel)
        contentView.addSubview(lastUpdatedLabel)
        contentView.addSubview(arrowAccessoryView)
        
        separator.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        activityCircle.translatesAutoresizingMaskIntoConstraints = false
        trackingIdTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        trackingIdLabel.translatesAutoresizingMaskIntoConstraints = false
        statusDetailsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        statusDetailsLabel.translatesAutoresizingMaskIntoConstraints = false
        lastUpdatedTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        lastUpdatedLabel.translatesAutoresizingMaskIntoConstraints = false
        arrowAccessoryView.translatesAutoresizingMaskIntoConstraints = false
        
        // separator
        NSLayoutConstraint.activate([
            separator.heightAnchor.constraint(equalToConstant: 1),
            separator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            separator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            separator.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        // titleLabel
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 9),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15)
        ])
        
        // activityCircle
        NSLayoutConstraint.activate([
            activityCircle.heightAnchor.constraint(equalToConstant: 6),
            activityCircle.widthAnchor.constraint(equalToConstant: 6),
            activityCircle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            activityCircle.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor)
        ])
        
        // trackingIdTitleLabel
        NSLayoutConstraint.activate([
            trackingIdTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 9),
            trackingIdTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5)
        ])
        
        // trackingIdLabel
        NSLayoutConstraint.activate([
            trackingIdLabel.bottomAnchor.constraint(equalTo: trackingIdTitleLabel.bottomAnchor),
            trackingIdLabel.leadingAnchor.constraint(equalTo: trackingIdTitleLabel.trailingAnchor, constant: 2)
        ])
        
        // statusDetailsTitleLabel
        NSLayoutConstraint.activate([
            statusDetailsTitleLabel.topAnchor.constraint(equalTo: trackingIdTitleLabel.bottomAnchor, constant: 7),
            statusDetailsTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5)
        ])
        
        // statusDetailsLabel
        NSLayoutConstraint.activate([
            statusDetailsLabel.bottomAnchor.constraint(equalTo: statusDetailsTitleLabel.bottomAnchor),
            statusDetailsLabel.leadingAnchor.constraint(equalTo: statusDetailsTitleLabel.trailingAnchor, constant: 2)
        ])
        
        // lastUpdatedTitleLabel
        NSLayoutConstraint.activate([
            lastUpdatedTitleLabel.topAnchor.constraint(equalTo: statusDetailsLabel.bottomAnchor, constant: 7),
            lastUpdatedTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            lastUpdatedTitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        ])
        
        // lastUpdatedLabel
        NSLayoutConstraint.activate([
            lastUpdatedLabel.bottomAnchor.constraint(equalTo: lastUpdatedTitleLabel.bottomAnchor),
            lastUpdatedLabel.leadingAnchor.constraint(equalTo: lastUpdatedTitleLabel.trailingAnchor, constant: 2),
            lastUpdatedLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        ])
        
        // arrowAccessoryView
        NSLayoutConstraint.activate([
            arrowAccessoryView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            arrowAccessoryView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -3)
        ])
    }

}
