ActiveAdmin.register Order do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :order_placed, :order_processed, :order_shipped, :order_status, :sub_total, :order_total, :total_payed, :taxes, :order_status_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:order_placed, :order_processed, :order_shipped, :order_status, :sub_total, :order_total, :total_payed, :taxes, :user_id, :order_status_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
