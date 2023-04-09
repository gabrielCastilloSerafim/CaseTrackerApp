//
//  HomeView.swift
//  Case Tracker
//
//  Created by Gabriel Castillo Serafim on 6/4/23.
//  
//

import UIKit

//MARK: - VIEW --> PRESENTER
class HomeView: UIViewController {
    
    //MARK: - Properties
    
    var presenter: HomePresenter?
    let animator = UIViewPropertyAnimator(duration: 0.4, curve: .easeOut)
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
        setupUI()
        
        // Call animations
        configureInitialSetup()
        addEndAnimations()
        animator.startAnimation(afterDelay: 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.navigationBar.isHidden = false
    }
    
    //MARK: - UIProperties
    
    private lazy var blurEffect: UIBlurEffect = {
        UIBlurEffect(style: .light)
    }()
    
    private lazy var baseScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private lazy var baseInnerView: UIView = {
        UIView()
    }()
    
    private lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "Background_gradient")
        return imageView
    }()
    
    private lazy var tabBarTopSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray.withAlphaComponent(0.7)
        return view
    }()
    
    private lazy var titleContainerView: UIView = {
        UIView()
    }()
    
    private lazy var topBlurView: UIVisualEffectView = {
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.layer.cornerRadius = 12
        visualEffectView.layer.masksToBounds = true
        visualEffectView.layer.borderWidth = 1
        visualEffectView.layer.borderColor = UIColor(white: 1, alpha: 0.25).cgColor
        return visualEffectView
    }()
    
    private lazy var bottomBlurView: UIVisualEffectView = {
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.layer.cornerRadius = 12
        visualEffectView.layer.masksToBounds = true
        visualEffectView.layer.borderWidth = 1
        visualEffectView.layer.borderColor = UIColor(white: 1, alpha: 0.25).cgColor
        return visualEffectView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 40, weight: .black)
        label.textColor = .white
        label.layer.shadowOffset = CGSize.zero
        label.layer.shadowOpacity = 0.75
        label.layer.shadowRadius = 3
        label.layer.shadowColor = UIColor.darkGray.cgColor
        label.text = "home_title".localized
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "home_subtitle".localized
        label.textColor = .white
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textAlignment = .right
        return label
    }()
    
    private lazy var USALogoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "USAGovernmentLogo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let profileImageContainer: UIView = {
        // Container (used to set the shadow for the imageView)
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        view.clipsToBounds = false
        view.layer.shadowColor = UIColor.darkGray.cgColor
        view.layer.shadowOpacity = 0.75
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = 3
        view.layer.shadowPath = UIBezierPath(roundedRect: view.bounds, cornerRadius: 30).cgPath
        // ImageView it self
        let imageView = UIImageView(frame: view.bounds)
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "sample_profile_picture_square")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 30
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor(white: 1, alpha: 1).cgColor
        // Add imageView as a subview Of the container
        view.addSubview(imageView)
        // Return the container view that has the imageView as a subview
        return view
    }()
    
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Gabriel Castillo Serafim"
        label.numberOfLines = 0
        label.textColor = .white
        label.layer.shadowOffset = CGSize.zero
        label.layer.shadowOpacity = 0.75
        label.layer.shadowRadius = 2
        label.layer.shadowColor = UIColor.darkGray.cgColor
        label.font = .systemFont(ofSize: 24, weight: .medium)
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 10, weight: .medium)
        return label
    }()
    
    private lazy var caseActivityContainer: UIVisualEffectView = {
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.layer.cornerRadius = 10
        visualEffectView.layer.masksToBounds = true
        visualEffectView.layer.borderWidth = 1
        visualEffectView.layer.borderColor = UIColor(white: 1, alpha: 0.25).cgColor
        return visualEffectView
    }()
    
    private lazy var caseActivityTitleLabel: UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.text = "activity_title".localized
        label.layer.shadowOffset = CGSize.zero
        label.layer.shadowOpacity = 0.75
        label.layer.shadowRadius = 1.5
        label.layer.shadowColor = UIColor.darkGray.cgColor
        return label
    }()
    
    private lazy var caseActivityStackView: UIStackView = {
        
        // firstActivityView
        let firstActivityView = UIView()
        
        let firstActivitySeparator = UIView()
        firstActivitySeparator.backgroundColor = .white
        
        let firstActivityApprovedText = UILabel()
        firstActivityApprovedText.font = .systemFont(ofSize: 13, weight: .semibold)
        firstActivityApprovedText.textColor = .white
        firstActivityApprovedText.text = "approved_label".localized
        
        let firstActivityGreenCircle = UIView()
        firstActivityGreenCircle.backgroundColor = .green
        firstActivityGreenCircle.layer.cornerRadius = 2.5
        firstActivityGreenCircle.layer.masksToBounds = true
        
        firstActivityView.addSubview(firstActivitySeparator)
        firstActivityView.addSubview(numberApprovedActivityLabel)
        firstActivityView.addSubview(firstActivityApprovedText)
        firstActivityView.addSubview(firstActivityGreenCircle)
        firstActivitySeparator.translatesAutoresizingMaskIntoConstraints = false
        numberApprovedActivityLabel.translatesAutoresizingMaskIntoConstraints = false
        firstActivityApprovedText.translatesAutoresizingMaskIntoConstraints = false
        firstActivityGreenCircle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            firstActivitySeparator.trailingAnchor.constraint(equalTo: firstActivityView.trailingAnchor),
            firstActivitySeparator.topAnchor.constraint(equalTo: firstActivityView.topAnchor, constant: 4),
            firstActivitySeparator.bottomAnchor.constraint(equalTo: firstActivityView.bottomAnchor, constant: -4),
            firstActivitySeparator.widthAnchor.constraint(equalToConstant: 1)
        ])
        NSLayoutConstraint.activate([
            numberApprovedActivityLabel.centerYAnchor.constraint(equalTo: firstActivityView.centerYAnchor, constant: -5),
            numberApprovedActivityLabel.centerXAnchor.constraint(equalTo: firstActivityView.centerXAnchor, constant: -7)
        ])
        NSLayoutConstraint.activate([
            firstActivityApprovedText.bottomAnchor.constraint(equalTo: firstActivityView.bottomAnchor, constant: -4),
            firstActivityApprovedText.centerXAnchor.constraint(equalTo: firstActivityView.centerXAnchor, constant: -4)
        ])
        NSLayoutConstraint.activate([
            firstActivityGreenCircle.heightAnchor.constraint(equalToConstant: 5),
            firstActivityGreenCircle.widthAnchor.constraint(equalToConstant: 5),
            firstActivityGreenCircle.centerYAnchor.constraint(equalTo: firstActivityApprovedText.centerYAnchor),
            firstActivityGreenCircle.trailingAnchor.constraint(equalTo: firstActivityApprovedText.leadingAnchor, constant: -7)
        ])
        
        // secondActivityView
        let secondActivityView = UIView()
        
        let secondActivitySeparator = UIView()
        secondActivitySeparator.backgroundColor = .white
        
        let secondActivityPendingText = UILabel()
        secondActivityPendingText.font = .systemFont(ofSize: 13, weight: .semibold)
        secondActivityPendingText.textColor = .white
        secondActivityPendingText.text = "pending_label".localized
        
        let secondActivityYellowCircle = UIView()
        secondActivityYellowCircle.backgroundColor = .yellow
        secondActivityYellowCircle.layer.cornerRadius = 2.5
        secondActivityYellowCircle.layer.masksToBounds = true
        
        secondActivityView.addSubview(secondActivitySeparator)
        secondActivityView.addSubview(numberOfPendingActivityLabel)
        secondActivityView.addSubview(secondActivityPendingText)
        secondActivityView.addSubview(secondActivityYellowCircle)
        secondActivitySeparator.translatesAutoresizingMaskIntoConstraints = false
        numberOfPendingActivityLabel.translatesAutoresizingMaskIntoConstraints = false
        secondActivityPendingText.translatesAutoresizingMaskIntoConstraints = false
        secondActivityYellowCircle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            secondActivitySeparator.trailingAnchor.constraint(equalTo: secondActivityView.trailingAnchor),
            secondActivitySeparator.topAnchor.constraint(equalTo: secondActivityView.topAnchor, constant: 4),
            secondActivitySeparator.bottomAnchor.constraint(equalTo: secondActivityView.bottomAnchor, constant: -4),
            secondActivitySeparator.widthAnchor.constraint(equalToConstant: 1)
        ])
        NSLayoutConstraint.activate([
            numberOfPendingActivityLabel.centerYAnchor.constraint(equalTo: secondActivityView.centerYAnchor, constant: -5),
            numberOfPendingActivityLabel.centerXAnchor.constraint(equalTo: secondActivityView.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            secondActivityPendingText.bottomAnchor.constraint(equalTo: secondActivityView.bottomAnchor, constant: -4),
            secondActivityPendingText.centerXAnchor.constraint(equalTo: secondActivityView.centerXAnchor, constant: 2)
        ])
        NSLayoutConstraint.activate([
            secondActivityYellowCircle.heightAnchor.constraint(equalToConstant: 5),
            secondActivityYellowCircle.widthAnchor.constraint(equalToConstant: 5),
            secondActivityYellowCircle.centerYAnchor.constraint(equalTo: secondActivityPendingText.centerYAnchor),
            secondActivityYellowCircle.trailingAnchor.constraint(equalTo: secondActivityPendingText.leadingAnchor, constant: -7)
        ])
        
        // thirdActivityView
        let thirdActivityView = UIView()
        
        let thirdActivityRejectedText = UILabel()
        thirdActivityRejectedText.font = .systemFont(ofSize: 13, weight: .semibold)
        thirdActivityRejectedText.textColor = .white
        thirdActivityRejectedText.text = "rejected_label".localized
        
        let thirdActivityRedCircle = UIView()
        thirdActivityRedCircle.backgroundColor = .red
        thirdActivityRedCircle.layer.cornerRadius = 2.5
        thirdActivityRedCircle.layer.masksToBounds = true
        
        thirdActivityView.addSubview(numberOfRejectedActivityLabel)
        thirdActivityView.addSubview(thirdActivityRejectedText)
        thirdActivityView.addSubview(thirdActivityRedCircle)
        numberOfRejectedActivityLabel.translatesAutoresizingMaskIntoConstraints = false
        thirdActivityRejectedText.translatesAutoresizingMaskIntoConstraints = false
        thirdActivityRedCircle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            numberOfRejectedActivityLabel.centerYAnchor.constraint(equalTo: thirdActivityView.centerYAnchor, constant: -5),
            numberOfRejectedActivityLabel.centerXAnchor.constraint(equalTo: thirdActivityView.centerXAnchor, constant: 7)
        ])
        NSLayoutConstraint.activate([
            thirdActivityRejectedText.bottomAnchor.constraint(equalTo: thirdActivityView.bottomAnchor, constant: -4),
            thirdActivityRejectedText.centerXAnchor.constraint(equalTo: thirdActivityView.centerXAnchor, constant: 8)
        ])
        NSLayoutConstraint.activate([
            thirdActivityRedCircle.heightAnchor.constraint(equalToConstant: 5),
            thirdActivityRedCircle.widthAnchor.constraint(equalToConstant: 5),
            thirdActivityRedCircle.centerYAnchor.constraint(equalTo: thirdActivityRejectedText.centerYAnchor),
            thirdActivityRedCircle.trailingAnchor.constraint(equalTo: thirdActivityRejectedText.leadingAnchor, constant: -7)
        ])
        
        // stackView
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.addArrangedSubview(firstActivityView)
        stackView.addArrangedSubview(secondActivityView)
        stackView.addArrangedSubview(thirdActivityView)
        
        return stackView
    }()
    
    private lazy var numberApprovedActivityLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.text = "4"
        label.textColor = .white
        return label
    }()
    
    private lazy var numberOfPendingActivityLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.text = "2"
        label.textColor = .white
        return label
    }()
    
    private lazy var numberOfRejectedActivityLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.text = "0"
        label.textColor = .white
        return label
    }()
    
    private lazy var myCasesLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30, weight: .black)
        label.textColor = .white
        label.layer.shadowOffset = CGSize(width: 0, height: 0)
        label.layer.shadowOpacity = 0.75
        label.layer.shadowRadius = 2.5
        label.layer.shadowColor = UIColor.darkGray.cgColor
        label.text = "my_cases".localized
        return label
    }()
    
    private lazy var myCasesTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.register(MyCasesCell.self, forCellReuseIdentifier: MyCasesCell.identifier)
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        tableView.allowsSelection = false
        return tableView
    }()
    
    private lazy var serverConnectionImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "app.connected.to.app.below.fill")
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.alpha = 0.85
        return imageView
    }()
    
    //MARK: - Methods
    
    //Configure the initial state for animated items
    private func configureInitialSetup() {
        titleContainerView.alpha = 0.2
        topBlurView.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
        bottomBlurView.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
    }
    
    //Configure final state of animation for animated items
    private func addEndAnimations() {
        
        //Add the scale and alpha animations
        animator.addAnimations {
            self.titleContainerView.alpha = 1
            self.topBlurView.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.bottomBlurView.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }
    
    func setupUI() {
        
        // Setup view delegates & datasources
        myCasesTableView.delegate = self
        myCasesTableView.dataSource = self
        
        // Add Subviews
        view.addSubview(backgroundImage)
        view.addSubview(baseScrollView)
        view.addSubview(tabBarTopSeparator)
        baseScrollView.addSubview(baseInnerView)
        baseInnerView.addSubview(titleContainerView)
        baseInnerView.addSubview(topBlurView)
        baseInnerView.addSubview(bottomBlurView)
        titleContainerView.addSubview(titleLabel)
        titleContainerView.addSubview(USALogoImage)
        titleContainerView.addSubview(subtitleLabel)
        topBlurView.contentView.addSubview(profileImageContainer)
        topBlurView.contentView.addSubview(userNameLabel)
        topBlurView.contentView.addSubview(dateLabel)
        topBlurView.contentView.addSubview(caseActivityContainer)
        caseActivityContainer.contentView.addSubview(caseActivityTitleLabel)
        caseActivityContainer.contentView.addSubview(caseActivityStackView)
        bottomBlurView.contentView.addSubview(myCasesLabel)
        bottomBlurView.contentView.addSubview(myCasesTableView)
        bottomBlurView.contentView.addSubview(serverConnectionImage)
        
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        baseScrollView.translatesAutoresizingMaskIntoConstraints = false
        tabBarTopSeparator.translatesAutoresizingMaskIntoConstraints = false
        baseInnerView.translatesAutoresizingMaskIntoConstraints = false
        titleContainerView.translatesAutoresizingMaskIntoConstraints = false
        topBlurView.translatesAutoresizingMaskIntoConstraints = false
        bottomBlurView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        USALogoImage.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        profileImageContainer.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        caseActivityContainer.translatesAutoresizingMaskIntoConstraints = false
        caseActivityTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        caseActivityStackView.translatesAutoresizingMaskIntoConstraints = false
        myCasesLabel.translatesAutoresizingMaskIntoConstraints = false
        myCasesTableView.translatesAutoresizingMaskIntoConstraints = false
        serverConnectionImage.translatesAutoresizingMaskIntoConstraints = false
        
        // backgroundImage
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // tabBarTopSeparator
        NSLayoutConstraint.activate([
            tabBarTopSeparator.heightAnchor.constraint(equalToConstant: 1),
            tabBarTopSeparator.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabBarTopSeparator.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabBarTopSeparator.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        // baseScrollView
        NSLayoutConstraint.activate([
            baseScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            baseScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            baseScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            baseScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        // baseInnerView
        NSLayoutConstraint.activate([
            baseInnerView.topAnchor.constraint(equalTo: baseScrollView.topAnchor, constant: -35),
            baseInnerView.leadingAnchor.constraint(equalTo: baseScrollView.leadingAnchor),
            baseInnerView.trailingAnchor.constraint(equalTo: baseScrollView.trailingAnchor),
            baseInnerView.bottomAnchor.constraint(equalTo: baseScrollView.bottomAnchor),
            baseInnerView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        // titleContainerView
        NSLayoutConstraint.activate([
            titleContainerView.topAnchor.constraint(equalTo: baseInnerView.topAnchor),
            titleContainerView.leadingAnchor.constraint(equalTo: baseInnerView.leadingAnchor),
            titleContainerView.trailingAnchor.constraint(equalTo: baseInnerView.trailingAnchor)
        ])
        
        // topBlurView
        NSLayoutConstraint.activate([
            topBlurView.topAnchor.constraint(equalTo: titleContainerView.bottomAnchor, constant: 10),
            topBlurView.leadingAnchor.constraint(equalTo: baseInnerView.leadingAnchor, constant: 15),
            topBlurView.trailingAnchor.constraint(equalTo: baseInnerView.trailingAnchor, constant: -15)
        ])
        
        // bottomBlurView
        NSLayoutConstraint.activate([
            bottomBlurView.topAnchor.constraint(equalTo: topBlurView.bottomAnchor, constant: 10),
            bottomBlurView.leadingAnchor.constraint(equalTo: baseInnerView.leadingAnchor, constant: 15),
            bottomBlurView.trailingAnchor.constraint(equalTo: baseInnerView.trailingAnchor, constant: -15),
            bottomBlurView.heightAnchor.constraint(equalToConstant: 545),
            bottomBlurView.bottomAnchor.constraint(equalTo: baseInnerView.bottomAnchor, constant: -10)
        ])
        
        // titleLabel
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: titleContainerView.topAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: titleContainerView.leadingAnchor, constant: 15)
        ])
        
        // USALogoImage
        NSLayoutConstraint.activate([
            USALogoImage.trailingAnchor.constraint(equalTo: titleContainerView.trailingAnchor, constant: -7),
            USALogoImage.topAnchor.constraint(equalTo: titleContainerView.topAnchor, constant: 17),
            USALogoImage.heightAnchor.constraint(equalToConstant: 67),
            USALogoImage.widthAnchor.constraint(equalToConstant: 57)
        ])
        
        // subtitleLabel
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 14),
            subtitleLabel.leadingAnchor.constraint(equalTo: titleContainerView.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: titleContainerView.trailingAnchor, constant: -15),
            subtitleLabel.bottomAnchor.constraint(equalTo: titleContainerView.bottomAnchor, constant: -15)
        ])
        
        // profileImageContainer
        NSLayoutConstraint.activate([
            profileImageContainer.topAnchor.constraint(equalTo: topBlurView.topAnchor, constant: 15),
            profileImageContainer.leadingAnchor.constraint(equalTo: topBlurView.leadingAnchor, constant: 15)
        ])
        
        // userNameLabel
        NSLayoutConstraint.activate([
            userNameLabel.topAnchor.constraint(equalTo: topBlurView.topAnchor, constant: 16),
            userNameLabel.leadingAnchor.constraint(equalTo: topBlurView.leadingAnchor, constant: 90),
            userNameLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.52)
        ])
        
        // dateLabel
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: topBlurView.topAnchor, constant: 10.5),
            dateLabel.trailingAnchor.constraint(equalTo: topBlurView.trailingAnchor, constant: -8.5)
        ])
        
        // caseActivityContainer
        NSLayoutConstraint.activate([
            caseActivityContainer.topAnchor.constraint(equalTo: topBlurView.topAnchor, constant: 90),
            caseActivityContainer.heightAnchor.constraint(equalToConstant: 100),
            caseActivityContainer.leadingAnchor.constraint(equalTo: topBlurView.leadingAnchor, constant: 15),
            caseActivityContainer.trailingAnchor.constraint(equalTo: topBlurView.trailingAnchor, constant: -15),
            caseActivityContainer.bottomAnchor.constraint(equalTo: topBlurView.bottomAnchor, constant: -15)
        ])
        
        // caseActivityTitleLabel
        NSLayoutConstraint.activate([
            caseActivityTitleLabel.topAnchor.constraint(equalTo: caseActivityContainer.topAnchor, constant: 8),
            caseActivityTitleLabel.leadingAnchor.constraint(equalTo: caseActivityContainer.leadingAnchor, constant: 10)
        ])
        
        // caseActivityStackView
        NSLayoutConstraint.activate([
            caseActivityStackView.topAnchor.constraint(equalTo: caseActivityTitleLabel.bottomAnchor, constant: 5),
            caseActivityStackView.leadingAnchor.constraint(equalTo: caseActivityContainer.leadingAnchor, constant: 10),
            caseActivityStackView.trailingAnchor.constraint(equalTo: caseActivityContainer.trailingAnchor, constant: -10),
            caseActivityStackView.bottomAnchor.constraint(equalTo: caseActivityContainer.bottomAnchor, constant: -5)
        ])
        
        // myCasesLabel
        NSLayoutConstraint.activate([
            myCasesLabel.topAnchor.constraint(equalTo: bottomBlurView.topAnchor, constant: 15),
            myCasesLabel.leadingAnchor.constraint(equalTo: bottomBlurView.leadingAnchor, constant: 15),
            myCasesLabel.trailingAnchor.constraint(equalTo: bottomBlurView.trailingAnchor, constant: -10)
        ])
        
        // myCasesTableView
        NSLayoutConstraint.activate([
            myCasesTableView.topAnchor.constraint(equalTo: myCasesLabel.bottomAnchor, constant: 15),
            myCasesTableView.leadingAnchor.constraint(equalTo: bottomBlurView.leadingAnchor, constant: 15),
            myCasesTableView.trailingAnchor.constraint(equalTo: bottomBlurView.trailingAnchor, constant: -15),
            myCasesTableView.bottomAnchor.constraint(equalTo: bottomBlurView.bottomAnchor, constant: -15)
        ])
        
        // serverConnectionImage
        NSLayoutConstraint.activate([
            serverConnectionImage.centerYAnchor.constraint(equalTo: myCasesLabel.centerYAnchor),
            serverConnectionImage.heightAnchor.constraint(equalToConstant: 20),
            serverConnectionImage.widthAnchor.constraint(equalToConstant: 20),
            serverConnectionImage.trailingAnchor.constraint(equalTo: bottomBlurView.trailingAnchor, constant: -18)
        ])
    }
}

//MARK: - VIEW <-- PRESENTER
extension HomeView: HomePresenterToView {
    
    func setDateLabelText(date: String?) {
        DispatchQueue.main.async {
            self.dateLabel.text = date
        }
    }
    
    func tableViewReloadData() {
        DispatchQueue.main.async {
            self.myCasesTableView.reloadData()
        }
    }
    
}

//MARK: - UITableViewDelegate & UITableViewDataSource
extension HomeView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.tableViewDataSource.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MyCasesCell.identifier, for: indexPath) as! MyCasesCell
        let datasourceObject = presenter?.tableViewDataSource[indexPath.row]
        
        cell.configure(
            title: datasourceObject?.title,
            trackingId: datasourceObject?.trackingId,
            statusDetails: datasourceObject?.statusDetails,
            lastUpdated: datasourceObject?.lastUpdated,
            style: datasourceObject?.style)
        cell.backgroundColor = .clear
        
        return cell
    }
    
    
}
