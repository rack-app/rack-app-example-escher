# Escher Auth REST App with Rack::App 

Escher is a stateless HTTP request signing spec to allow secure authorization and request validation. 
It adds an additional security layer and an authentication layer over HTTPS. 
The algorithm is based on Amazon’s AWS4 authentication. 
The goal was implementing a protocol where request’s integrity is validated. 
It is impossible to be modified without knowing the secret.

Escher is great for creating secure REST API servers, both the client side request signing process, 
and the server side validation and authentication processes are implemented. 

The protocol also provides a solution for presigning URLs with expiration time.

## Install 

  $ bundle install 
  
  $ rackup
   
  $ sh ping.sh