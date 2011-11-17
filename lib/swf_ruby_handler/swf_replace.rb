module SwfRubyHandler
	module SwfReplace
		def init_targets
			@array = []
		end

		def replace_targets
			@array
		end

		def as_var offset, length, var
			if var
				var = case var
					when String
						var.encode('Windows-31J')
					else
						var.to_s
					end
				@array << SwfRuby::AsVarReplaceTarget.new( offset, length, var )
			end
		end

		def lossless2 offset, var
			if var.encoding != Encoding::ASCII_8BIT
				var = File.open( var, 'rb' ).read
			end

			@array << SwfRuby::Lossless2ReplaceTarget.new( offset, var)
		end

		def lossless offset, var
			if var.encoding != Encoding::ASCII_8BIT
				var = File.open( var, 'rb' ).read
			end

			@array << SwfRuby::LosslessReplaceTarget.new( offset, var)
		end
	end
end
