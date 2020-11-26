//
//  UIColor+ColorSet.swift
//  TaiwanComic
//
//  Created by goodideas-studio on 2020/11/24.
//

import DynamicColor
import UIKit

extension UIColor {
    /// 主色 淺綠色
    static var mainColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
    /// 主色 淺綠色 淡化
    static var mainlightColor = mainColor.lighter()
    /// 輔色 粉紅色
    static var subColor = #colorLiteral(red: 0.9319149852, green: 0.6053853631, blue: 0.6438395381, alpha: 1)
    /// 輔色 淡黃色
    static var sub2Color = #colorLiteral(red: 0.9779960513, green: 0.7567589283, blue: 0.3455901146, alpha: 1)
    /// 輔色 淡藍色
    static var sub3Color = #colorLiteral(red: 0.2963595688, green: 0.5946460962, blue: 0.7117678523, alpha: 1)
    /// 分隔色塊
    static var spaceColor = #colorLiteral(red: 0.9567589164, green: 0.9569225907, blue: 0.9567485452, alpha: 1)
    /// 較大範圍背景底色，輸入框底色
    static var backgroundColor = #colorLiteral(red: 0.9724436402, green: 0.972609818, blue: 0.9724331498, alpha: 1)
    /// 標題 按鈕
    static var titleColor = #colorLiteral(red: 0.1333139837, green: 0.1333444417, blue: 0.1333120763, alpha: 1)
    /// 小標題
    static var title2Color = #colorLiteral(red: 0.2666336298, green: 0.2666856647, blue: 0.2666303515, alpha: 1)
    /// 內文
    static var textColor = #colorLiteral(red: 0.3999532461, green: 0.4000268579, blue: 0.3999486566, alpha: 1)
    /// 日期，輔助文字，虛線
    static var subtextColor = #colorLiteral(red: 0.7763852477, green: 0.7765197158, blue: 0.7763767838, alpha: 1)
    /// 標籤文字
    static var subtext2Color = #colorLiteral(red: 0.666592598, green: 0.6667093039, blue: 0.666585207, alpha: 1)
    /// 圖片匡線，分隔線
    static var separatorColor = #colorLiteral(red: 0.9332318306, green: 0.9333917499, blue: 0.933221817, alpha: 1)
    /// 短分隔線
    static var shortSeparatorColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1)
    /// press底色
    static var pressColor = #colorLiteral(red: 0.1333333333, green: 0.1333333333, blue: 0.1333333333, alpha: 0.05)
    /// 警示文字
    static var warningColor = #colorLiteral(red: 0.8705882353, green: 0.2705882353, blue: 0.1725490196, alpha: 1)
    /// 背景顏色
    static var customBackgroundColor = UIColor.white
}
