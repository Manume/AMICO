CarrierWave.configure do |config|
		config.fog_credentials = {
			provider: "AWS",
			aws_access_key_id: "AKIAIIXQJFOTD2VGFU6Q",
			aws_secret_access_key: "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",
			region: "us-east-1"
		}
		config.fog_directory="navin_test"

end