module ResourcesHelper

  def rolecheck(area)
  @resource.role.nil? ? false : @resource.role.match(area)
  end

  def languagecheck(area)
  @resource.language.nil? ? false : @resource.language.match(area)
  end

end
