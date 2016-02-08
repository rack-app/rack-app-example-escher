require './credential'

require 'faraday_middleware/escher'

use FaradayMiddleware::Escher::RequestSigner,
    credential_scope: Credential::Scope,
    options: Credential::AuthOptions,
    active_key: -> { Escher::Keypool.new.get_active_key('EscherExample') }