require 'openssl'
require 'base64'
require 'cgi'

class TrustpilotBusinessLinks
  ENCRYPTION_CIPHER = 'AES-256-CBC'
  HMAC_DIGEST = 'SHA256'

  def initialize(encryption_key, authentication_key)
    @encryption_key = Base64.strict_decode64(encryption_key)
    @authentication_key = Base64.strict_decode64(authentication_key)
  end

  def encrypt(payload)
    encrypted_payload, iv = encrypt_iv(payload)
    hmac = hmac(iv, encrypted_payload)

    encode(iv + encrypted_payload + hmac)
  end

  private

  attr_accessor :encryption_key, :authentication_key

  def encrypt_iv(data)
    cipher = OpenSSL::Cipher.new(ENCRYPTION_CIPHER)
    cipher.encrypt
    cipher.key = encryption_key
    iv = cipher.random_iv
    encrypted_payload = cipher.update(data) + cipher.final

    [encrypted_payload, iv]
  end

  def hmac(iv, encrypted_payload)
    OpenSSL::HMAC.digest(HMAC_DIGEST, authentication_key, iv + encrypted_payload)
  end

  def encode(payload)
    CGI.escape(Base64.strict_encode64(payload))
  end
end
