//
//  StringExt.swift
//  SWFrame
//
//  Created by 杨建祥 on 2020/4/14.
//

import UIKit
import QMUIKit
import CGFloatLiteral

public extension String {
    
    func rect(with size: CGSize, attributes: [NSAttributedString.Key: Any]) -> CGRect {
        let options: NSStringDrawingOptions = [.usesLineFragmentOrigin, .usesFontLeading]
        let rect = self.boundingRect(with: size, options: options, attributes: attributes, context: nil)
        return CGRectFlatted(rect)
    }
    
    func size(thatFits size: CGSize, font: UIFont, maxLines: Int = 0) -> CGSize {
        let attributes: [NSAttributedString.Key: Any] = [.font: font]
        var size = self.rect(with: size, attributes: attributes).size
        if maxLines > 0 {
            size.height = flat(min(size.height, maxLines.f * font.lineHeight))
        }
        return size
    }
    
    func width(with font: UIFont, maxLines: Int = 0) -> CGFloat {
        let size = CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
        return self.size(thatFits: size, font: font, maxLines: maxLines).width
    }
    
    func height(thatFitsWidth width: CGFloat, font: UIFont, maxLines: Int = 0) -> CGFloat {
        let size = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        return self.size(thatFits: size, font: font, maxLines: maxLines).height
    }
    
}