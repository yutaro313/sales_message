module ApplicationHelper
  def post_user_name(post_user_id, type)
    if type == 0
      get_name(Sale, post_user_id)
    elsif type == 1
      get_name(Customer, post_user_id)
    else
      "User not exit"
    end
  end

  private

  def get_name(model, id)
    model.find(id).name || "no name"
  end

end
