module ResourcesHelper

  def checked(area)
  @resource.role.nil? ? false : @resource.role.match(area)
end

  def checked(area)
  @resource.language.nil? ? false : @resource.language.match(area)
end

end
