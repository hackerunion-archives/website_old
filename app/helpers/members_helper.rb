module MembersHelper

  def affiliations_list_for member
    member.affiliations.collect(&:name).join(", ")
  end

end