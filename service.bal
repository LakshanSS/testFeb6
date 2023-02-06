import ballerina/http;
//import ballerina/grpc;
import ballerina/io;
import wso2/client_stubs as stubs;

# A service representing a network-accessible API
# bound to port `9090`.
service / on new http:Listener(9090) {

    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error
    resource function get greeting(string name) returns string|error {
        //http:Client cl = check new("http://prodcat-2479457892:9091/");
        stubs:ProductCatalogServiceClient catalogClient = check new("http://prodcat-2479457892:9091");
        stubs:ListProductsResponse productsResponse = check catalogClient->ListProducts({});
        io:println(productsResponse);
        // Send a response back to the caller.
        if name is "" {
            return error("name should not be empty!");
        }
        return "Hello, " + name;
    }
}
