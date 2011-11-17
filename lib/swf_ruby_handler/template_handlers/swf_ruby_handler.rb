module SwfRubyHandler
	module TemplateHandlers
		class SwfRubyHandler
		  def call(template)
				fname = template.identifier.gsub( %r".swf_ruby$", "" )

				output = ERB.new <<-EOS.strip_heredoc, nil, "-"
					-- TemplateHandlers::SwfRubyHandler.call
					<% replace_targets.each do |x| -%>
					  <%= x.class.name %> offset:<%= x.offset %>
					<% end %>
				EOS

				<<-EOS
					self.extend SwfRubyHandler::SwfReplace
					init_targets

					#{template.source}

					st = SwfRuby::SwfTamperer.new
					repl_swf = File.read( "#{ fname }" )

					#{output.src}
					Rails.logger.debug( "\n" + _erbout )

					st.replace( repl_swf, replace_targets )
				EOS
			end
		end
	end
end
