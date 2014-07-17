module RoleHelpers
  def within_role(role_name, &blk)
    within("[data-role='#{role_name}']", &blk)
  end
end

World(RoleHelpers)