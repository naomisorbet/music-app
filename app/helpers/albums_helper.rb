module AlbumsHelper

  def value(album, key)
    return if album.nil?
    value = album.send(key)
    "value='#{value}'"
  end

  def selected(exisiting_value, option_value)
    return if exisiting_value.nil? || option_value.nil?
    if existing_value == option_value
      "selected='selected'"
    end
  end

end
