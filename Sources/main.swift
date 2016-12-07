import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

// Create HTTP server.
let server = HTTPServer()

// Register your own routes and handlers
var routes = Routes()
routes.add(method: .get, uri: "/", handler: {
    request, response in
    response.setHeader(.contentType, value: "text/html")
    response.appendBody(string: "<!DOCTYPE html><html><title>Wee Chun</title><body>Hello, Weechun!</body></html>")
    response.completed()
})

// Add the routes to the server
server.addRoutes(routes)

// Set a listen port of 8080
server.serverPort = 8080

do {
    // Launch the HTTP server.
    try server.start()
} catch PerfectError.networkError(let err, let msg) {
    print("Network error thrown: \(err) \(msg)")
}
