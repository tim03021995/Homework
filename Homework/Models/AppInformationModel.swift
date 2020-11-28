//
//  AppInformation.swift
//  RedSo
//
//  Created by Alvin Tseng on 2020/11/11.
//

import Foundation

// MARK: - NetWorking

struct HTTPRequest {
//    let method:Method
//    let host:Host
//    let pathType:PathType
//    let header:[String:String]?
//    let parameters:[String:Any]?
//    let body:[String:Any]
    let request: URLRequest!

    func request<T: Codable>(completionHandler: @escaping (Result<T, NetworkError>) -> Void) {
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 20
        sessionConfig.timeoutIntervalForResource = 20
        let session = URLSession(configuration: sessionConfig)
        let task = session.dataTask(with: request!) { data, response, error in
            DispatchQueue.main.async {
                if error != nil {
                    completionHandler(.failure(.requestFailed(error!)))
                }
                guard let response = response as? HTTPURLResponse else {
                    completionHandler(.failure(.nonHTTPResponse))
                    return
                }
                print(response.statusCode)
                guard let data = data else {
                    completionHandler(.failure(.nilData))
                    return
                }

                switch response.statusCode {
                case 200:
                    // print(data)
                    decodeData(data: data, complitionHandler: completionHandler)
                default:
                    decodeData(data: data) { (res: Result<ErrorMessage, NetworkError>) in
                        switch res {
                        case let .success(data):
                            completionHandler(.failure(.invalidResponse(data)))
                        case .failure:
                            completionHandler(.failure(._invalidJSONDecoder))
                        }
                    }
                }
            }
        }
        task.resume()
    }

    init(method: Method, host: Host, pathType: PathType, token: String? = nil, parameters: [String: Any]? = nil) {
        var urlComponents = URLComponents()
        urlComponents.host = host.str
        urlComponents.scheme = Schme.http.str
        urlComponents.path = pathType.str

        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = method.rawValue
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        if let token = token {
            urlRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
            } catch {
                print(error.localizedDescription)
            }
        }
        request = urlRequest
    }

    enum PathType {
        case demo(endPoint: DemoEndPoint)
        case webdemo(endPoint: WebDemoEndPoint)

        var str: String {
            switch self {
            case let .demo(endPoint):
                return "/files/appexam/\(endPoint.rawValue).htm"
            case let .webdemo(endPoint):
                return "/AppTest/api/\(endPoint.rawValue)"
            }
        }

        enum DemoEndPoint: String {
            case appexam1, appexam2
        }

        enum WebDemoEndPoint: String {
            case GetToken, MemberData, MemberLogin
        }
    }

    enum Host {
        case demo, webDemo
        var str: String {
            switch self {
            case .demo:
                return "demo.kidtech.com.tw"
            case .webDemo:
                return "webdemo.kidtech.com.tw"
            }
        }
    }

    enum Method: String {
        case GET, POST
    }

    enum Schme {
        case http, https
        var str: String {
            switch self {
            case .http:
                return "http"
            case .https:
                return "https"
            }
        }
    }

    private func decodeData<T: Codable>(data: Data, complitionHandler: @escaping (Result<T, NetworkError>) -> Void) {
        let decoder = JSONDecoder()
        do {
            let data = try decoder.decode(T.self, from: data)
            complitionHandler(.success(data))
        } catch {
            complitionHandler(.failure(.invalidJSONDecoder(error)))
        }
    }
}

enum NetworkError: Error {
    case invalidUrl
    case requestFailed(Error)
    case invalidData
    case invalidResponse(ErrorMessage)
    case invalidJSONDecoder(Error)
    case _invalidJSONDecoder
    case tokenError
    case nilData
    case nonHTTPResponse

    var description: String {
        switch self {
        case .invalidUrl:
            return ("invalidUrl")
        case .requestFailed:
            return ("requestFailed")
        case .invalidData:
            return ("invalidData")
        case .invalidResponse:
            return ("invalidResponse")
        case .invalidJSONDecoder:
            return ("invalidJSONDecoder")
//        case .tokenError:
//            return("invalidUrl")
        case .nilData:
            return ("nilData")
        case .nonHTTPResponse:
            return ("requestFailed")
        default:
            return (localizedDescription)
        }
    }
}

struct ErrorMessage: Codable {
    var message: String
    var reason: String
}

struct Message: Codable {
    var message: String
    // let content: Content?
}

// MARK: CellType

enum ResultCellType: String {
    case banner, employee
}

private func printJSON(metadata: Any) {
    let jsonData = try! JSONSerialization.data(withJSONObject: metadata)
    // Convert to a string and print
    if let JSONString = String(data: jsonData, encoding: String.Encoding.utf8) {
        print(JSONString)
    }
}
