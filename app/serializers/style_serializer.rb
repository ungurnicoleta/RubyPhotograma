class StyleSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :photographer_id
end
