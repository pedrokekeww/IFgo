//
//  LabRef.swift
//  IFgo
//
//  Created by found on 30/07/25.
//


import SwiftData
import Foundation


@Model
class LabRef{
    var date = Date()
    var labIndex: Int

    init(labIndex: Int){
        self.labIndex = labIndex
    }
}
