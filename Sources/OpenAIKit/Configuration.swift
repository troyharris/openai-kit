import NIOHTTP1

public struct Configuration {
    public let apiKey: String
    public let organization: String?
    public let api: API?
    public var bearer: String = "bearer"
    
    var headers: HTTPHeaders {
        var headers = HTTPHeaders()
        headers.add(name: "Authorization", value: "\(bearer) \(apiKey)")

        if let organization = organization {
            headers.add(name: "OpenAI-Organization", value: organization)
        }
        
        return headers
    }
    
    public init(
        apiKey: String,
        organization: String? = nil,
        api: API? = nil,
        bearer: String = "bearer"
    ) {
        self.apiKey = apiKey
        self.organization = organization
        self.api = api
        self.bearer = bearer
    }
    
}
