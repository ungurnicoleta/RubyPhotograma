Warden::JWTAuth.configure do |config|
  config.secret = '71ffb91c6d7fff4ea680ee20605f099aa9ecb4b000df951cf9402c245ac987ed42db87491367b942d507f55ab2485ab74293f8a1bff7789440002571ffb49c96'
  config.dispatch_requests = [
      ['POST', %r{^/api/login$}],
      ['POST', %r{^/api/login.json$}]
  ]
  config.revocation_requests = [
      ['DELETE', %r{^/api/logout$}],
      ['DELETE', %r{^/api/logout.json$}]
  ]
end