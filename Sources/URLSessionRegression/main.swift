import Foundation
import Dispatch

let session = URLSession(configuration: .default)

func makeRequest() {
   // let session = URLSession(configuration: .default)
    
    let request = URLRequest(url: URL(string: "https://httpbin.org/ip")!)
    let task = session.dataTask(with: request) { (data, response, error) in
        guard error == nil, let httpResponse = response as? HTTPURLResponse else {
            print("Error: \(String(describing: error)) | Response: \(String(describing: response))")
            return
        }
        
        if let data = data, let json = String(bytes: data, encoding: .utf8) {
            print("HTTP response: \(httpResponse.statusCode) | Body: \(json)")
        }
    }
    task.resume()
}

// First request completes and CPU usage drops
makeRequest()

DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
    // Whilst subsequent requests succeed, if URLSession was not recreated the process will be consuming a constant amount of CPU
    makeRequest()
}

RunLoop.main.run()
