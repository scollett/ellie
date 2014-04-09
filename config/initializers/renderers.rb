ActionController::Renderers.add :marcxml do |object, options|
  self.content_type ||= Mime::MARCXML
  object.respond_to?(:to_marcxml) ? object.to_marcxml : object
end