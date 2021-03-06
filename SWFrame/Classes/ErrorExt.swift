//
//  ErrorExt.swift
//  SWFrame
//
//  Created by 杨建祥 on 2020/4/11.
//

import UIKit
import Moya

public enum AppError: Error {
    case network
    case server
    case empty
    case expire
}

public extension Error {
    
    var image: UIImage {
        if let error = self as? AppError {
            switch error {
            case .network:
                return .networkError
            case .server:
                return .serverError
            case .empty:
                return .emptyError
            case .expire:
                return .expireError
            }
        }
        if (self as NSError).isNetwork {
            return .networkError
        } else if (self as NSError).isExpire {
            return .expireError
        } else {
            return .serverError
        }
    }

    var title: String {
        if let error = self as? AppError {
            switch error {
            case .network:
                return NSLocalizedString("Error.Network.Title", comment: "")
            case .server:
                return NSLocalizedString("Error.Server.Title", comment: "")
            case .empty:
                return NSLocalizedString("Error.Empty.Title", comment: "")
            case .expire:
                return NSLocalizedString("Error.Expire.Title", comment: "")
            }
        }
        
        if (self as NSError).isNetwork {
            return NSLocalizedString("Error.Network.Title", comment: "")
        } else if (self as NSError).isExpire {
            return NSLocalizedString("Error.Expire.Title", comment: "")
        } else {
            return NSLocalizedString("Error.Server.Title", comment: "")
        }
    }

    var message: String {
        if let error = self as? AppError {
            switch error {
            case .network:
                return NSLocalizedString("Error.Network.Message", comment: "")
            case .server:
                return NSLocalizedString("Error.Server.Message", comment: "")
            case .empty:
                return NSLocalizedString("Error.Empty.Message", comment: "")
            case .expire:
                return NSLocalizedString("Error.Expire.Message", comment: "")
            }
        }
        
        if (self as NSError).isNetwork {
            return NSLocalizedString("Error.Network.Message", comment: "")
        } else if (self as NSError).isExpire {
            return NSLocalizedString("Error.Expire.Message", comment: "")
        } else {
            return NSLocalizedString("Error.Server.Message", comment: "")
        }
    }
    
    var retryTitle: String {
//        guard let error = self as? AppError else { return "" }
//        switch error {
//        case .network:
//            return "网络错误"
//        case .server:
//            return NSLocalizedString("Error.Server.Title", comment: "")
//        case .empty:
//            return "数据为空"
//        }
        return NSLocalizedString("Error.Retry", comment: "")
    }
    
}
