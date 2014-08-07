module RoleHelpers
  def within_role(role_name, &blk)
    within("[data-role='#{role_name}']", &blk)
  end

  def click_role(role_name)
    page.first("[data-role='#{role_name}']").click
  end
end

World(RoleHelpers)