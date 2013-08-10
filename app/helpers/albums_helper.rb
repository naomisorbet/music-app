module AlbumsHelper

  def value(album, key)
    return if album.nil?
    album.send(key)
  end

  def selected(existing_value, option_value)
    return if existing_value.nil? || option_value.nil?
    if existing_value == option_value
      "selected='selected'"
    end
  end

end
