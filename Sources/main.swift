import Foundation
import Kitura
import HeliumLogger

// Initialize HeliumLogger
HeliumLogger.use()

// Create new router
let router = Router()

// Handle HTTP GET requests to /
router.get("/") { request, response, next in
    response.send("Hello world")
    next()
}

// Resolve the port that we want the server to listen on.
let port: Int
let defaultPort = 8080
if let requestedPort = ProcessInfo.processInfo.environment["PORT"] {
    port = Int(requestedPort) ?? defaultPort
} 
else {
    port = defaultPort
}

// Add an HTTP server and connect it to the router
Kitura.addHTTPServer(onPort: port, with: router)

// Start the Kitura runloop (this call never returns)
Kitura.run()

