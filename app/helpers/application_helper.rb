module ApplicationHelper
  MODEL = %w(Sale Customer)
  def post_user_name(post_user_id, type)
    get_name(MODEL[type], post_user_id) if (type == 0) || (type == 1)
  end

  private

  def get_name(model, id)
    model.constantize.find(id).name || "no name"
  end
end
