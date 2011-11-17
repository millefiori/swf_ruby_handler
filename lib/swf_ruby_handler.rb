require "swf_ruby_handler/version"
require "swf_ruby_handler/swf_replace"
require "swf_ruby_handler/template_handlers/swf_ruby_handler"

ActionView::Template.register_template_handler :swf_ruby, SwfRubyHandler::TemplateHandlers::SwfRubyHandler.new

ActionController::Renderers.add :swf do |obj, options|
	response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
	response.headers["Pragma"] = "no-cache"
	response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"

	render obj
end
