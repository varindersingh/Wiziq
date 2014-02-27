require_relative '../spec_helper'
describe Wiziq::Auth do


	let(:access_key) { "YWJjZGVmZ2g="  }
	let(:secret_key) { "cHFyc3R1dnd4eXo="  }
	let(:api_method) { "create" }
	let(:digest) { "J93YzsXV6SDc+Nl0f8IDa3N9Abc=" } #pre computed digest.Do not modify
	
	before do
		@auth ||= Wiziq::Auth.new(access_key,secret_key)
		@auth.timestamp = 1393388207
		@auth_params = @auth.get_auth_params(api_method)
	end

	describe "#get_auth_params" do

		it "should include acess_key,secret_key and timestamp" do
			@auth_params.must_include "access_key"
			@auth_params.must_include "timestamp"
			@auth_params.must_include "method"
		end
	end
	
	describe '#get_signature_base' do

		specify "access_key,timestamp,method in order and query format" do
			@auth.get_signature_base.must_match /^access_key=(.+)&timestamp=(\d)+&method=(.+)$/
		end
	end

	describe '#get_signature_digest' do
	
		it "should generate a valid HMAC digest" do
			@auth.get_signature_digest.must_equal digest
		end
	end
end
