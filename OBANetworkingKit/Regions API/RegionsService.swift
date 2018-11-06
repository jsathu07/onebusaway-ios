//
//  RegionsService.swift
//  OBANetworkingKit
//
//  Created by Aaron Brethorst on 10/11/18.
//  Copyright © 2018 OneBusAway. All rights reserved.
//

import Foundation

@objc(OBARegionsService)
public class RegionsService: APIService {

    @discardableResult @objc
    public func getRegions() -> RegionsOperation {
        let url = RegionsOperation.buildURL(baseURL: baseURL, queryItems: defaultQueryItems)

        let operation = RegionsOperation(url: url)
        networkQueue.addOperation(operation)

        return operation
    }
}
