Rails.application.config.middleware.use OmniAuth::Builder do
  provider :steam,'38E17F34FCA00C9A3AFAADF930E82F32'
end

require 'omniauth-steam'