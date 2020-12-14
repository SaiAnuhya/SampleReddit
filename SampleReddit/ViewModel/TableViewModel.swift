//
//  TableViewModel.swift
//  SampleReddit
//
//  Created by Anuhya Kodimela on 12/13/20.
//

import Foundation

protocol TableViewModelDelegate: class {
    func onFetchCompleted()
    func onFetchFailed(with reason: String)
}

final class TableViewModel
{
    private var feeds: [Feed] = []
    private var isFetchInProgress = false
    private weak var delegate : TableViewModelDelegate?
    private var request  = FeedRequest()
    private var afterval = ""
    private let client : NetworkClient
    
    init(delegate: TableViewModelDelegate, networkClient:NetworkClient) {
        self.delegate = delegate
        self.client = networkClient
    }
    
    func getFeed(at index: Int) -> Feed {
        return feeds[index]
    }
    
    func getCount ()-> Int{
        return feeds.count
    }
    
    func fetchFeedData() {
        guard !isFetchInProgress else {
            return
        }
     
        isFetchInProgress = true

        let reqobj = request.createRequest(after: afterval)
        DispatchQueue.global(qos: .utility).async {
            self.client.fetchData(with: reqobj ,completion: { response in
                    if let response = response{
                        switch response.status {
                            case .error:
                                    self.isFetchInProgress = false
                                    self.delegate?.onFetchFailed(with: "error")
                                
                            case .success:
                                    DispatchQueue.main.async { [self] in
                                        self.isFetchInProgress = false
                                        self.afterval = response.after
                                        self.feeds.append(contentsOf: response.feeds)
                                        self.delegate?.onFetchCompleted()
                                    }
                            default:
                                return
                        }
                }
                
            })
        }
    
    }
}
