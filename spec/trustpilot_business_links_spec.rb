require "helper"
require "json"

class TrustpilotBusinessLinks
  describe TrustpilotBusinessLinks do
    let(:encryption_key) { 'gn96sJwFRQuQl3bjNIPM0xp+TnK4iBaW0I4DpR0o+cs=' }
    let(:authentication_key) { 'eE4zdEfGNlxjGVjtWpOLAYAM0gKeF5j6Db7ZXd1Bixo=' }
    let(:iv) { Base64.strict_decode64("vjtBtRC6poWv2GrWd2sXDg==") }
    let(:trustpilot_generator) { TrustpilotBusinessLinks.new(encryption_key, authentication_key) }

    before do
      # Fake the IV generation to get a stable encrypted output
      allow_any_instance_of(OpenSSL::Cipher).to receive(:random_iv).and_return(iv)
    end

    describe "#encrypt" do
      it "encrypts and URL encodes correctly the payload" do
        payload = {
          email: "test@example.com",
          name: "John Smith",
          ref: "1234",
        }
        encrypted_payload = trustpilot_generator.encrypt(payload.to_json)

        expect(encrypted_payload).to eq('vjtBtRC6poWv2GrWd2sXDkqw%2FxhXg2kKX7yKDyPPHWyRcdG4gC3YUUFhJ6glpaWcboDO%2FE93H5OCcP20W12rhqcSpQjTcvhcACpiw4awvi0vInbj9PIh8QR00ch%2BsdErA3E1Wy9fEtc5BL8iYWFvgA%3D%3D')
      end
    end
  end
end
