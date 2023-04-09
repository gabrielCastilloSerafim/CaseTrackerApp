//
//  ViewController.swift
//  Case Tracker
//
//  Created by Gabriel Castillo Serafim on 20/3/23.
//

import UIKit

//MARK: - App's Main navigation controller
class MainNavigationController: UINavigationController {
    
    static func createMainNavigationController() -> UINavigationController {
        
        let mainTabController = MainTabController.createMainTabController()
        let mainNavigationController = UINavigationController(rootViewController: mainTabController)
        
        return mainNavigationController
    }
}

//MARK: - App's Main tab bar controller
class MainTabController: UITabBarController {
    
    static func createMainTabController() -> UITabBarController {
        
        let mainTabController = UITabBarController()
        
        // "Example" View Controllers
        
        let vc1 = UINavigationController(rootViewController: HomeRouter.createModule())
        vc1.tabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill"))
        
        let vc2 = UINavigationController(rootViewController: SecondViewController())
        vc2.tabBarItem = UITabBarItem(
            title: "New",
            image: UIImage(systemName: "doc.text"),
            selectedImage: UIImage(systemName: "doc.text.fill"))
        
        mainTabController.setViewControllers([vc1, vc2], animated: false)
        UITabBar.appearance().barTintColor = .systemBackground
        mainTabController.tabBar.tintColor = UIColor(named: "MyDarkBlue")
        mainTabController.tabBar.backgroundColor = .white
        
        return mainTabController
    }
}

//MARK: - "Example" view controllers
//class FirstViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//       setupView()
//    }
//
//    private lazy var labelOne: UILabel = {
//
//        let label = UILabel()
//        label.text = "hello".localized(args: ["Jose", "Augusto"])
//        label.textAlignment = .center
//
//        return label
//    }()
//
//    private lazy var labelTwo: UILabel = {
//
//        let label = UILabel()
//        label.text = "hello".localized
//        label.textAlignment = .center
//
//        return label
//    }()
//
//    func setupView() {
//
//        view.backgroundColor = .white
//
//        view.addSubview(labelOne)
//        view.addSubview(labelTwo)
//
//        labelOne.translatesAutoresizingMaskIntoConstraints = false
//        labelTwo.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            labelOne.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            labelOne.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//        ])
//
//        NSLayoutConstraint.activate([
//            labelTwo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            labelTwo.topAnchor.constraint(equalTo: labelOne.bottomAnchor, constant: 30)
//        ])
//
//    }
//
//}

class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        getAuth()
//        getRelevantInfo()
    }
    
    func getAuth() {
        
        let headers = ["content-type": "application/x-www-form-urlencoded"]
        
        let postData = NSMutableData(data: "grant_type=client_credentials".data(using: String.Encoding.utf8)!)
        postData.append("&client_id=KpDa0eFSODfvWGq3AzTkCMSmbRTgisxe".data(using: String.Encoding.utf8)!)
        postData.append("&client_secret=24l0xSszqtXcPLqx".data(using: String.Encoding.utf8)!)
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://api-int.uscis.gov/oauth/accesstoken")! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data
        
        print(request.url)
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            
            if let data = data {
                let myData = try? JSONDecoder().decode(Welcome.self, from: data)
                print(myData)
            }
            
        })
        
        dataTask.resume()
    }
    
    func getRelevantInfo() {
        
        let url = URL(string: "https://api-int.uscis.gov/first-case-sbox/case-status")!
        
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = [
            URLQueryItem(name: "caseControlNumber", value: "dsfgsdfgsdfg"),
            URLQueryItem(name: "requestNumber", value: "lajsfhgiuh")
        ]
        
        let token = "Q9ywxdY8NvlHZiAM7l982eSDocty"
        var request = URLRequest(url: (urlComponents?.url)!)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, response , error) in
            guard let data = data else { return }
            print(String(data: data, encoding: .utf8) ?? "Invalid JSON")
            
        }.resume()
    }
    
    
    
}

struct Welcome: Codable {
    let refreshTokenExpiresIn, apiProductList: String
    let apiProductListJSON: [String]
    let organizationName, developerEmail, tokenType, issuedAt: String
    let clientID, accessToken, applicationName, scope: String
    let expiresIn, refreshCount, status: String

    enum CodingKeys: String, CodingKey {
        case refreshTokenExpiresIn = "refresh_token_expires_in"
        case apiProductList = "api_product_list"
        case apiProductListJSON = "api_product_list_json"
        case organizationName = "organization_name"
        case developerEmail = "developer.email"
        case tokenType = "token_type"
        case issuedAt = "issued_at"
        case clientID = "client_id"
        case accessToken = "access_token"
        case applicationName = "application_name"
        case scope
        case expiresIn = "expires_in"
        case refreshCount = "refresh_count"
        case status
    }
}
