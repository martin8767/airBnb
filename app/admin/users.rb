ActiveAdmin.register User do
  permit_params :first_name, :last_name, :email, :allow_password_change, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column :first_name
    column :last_name
    column :allow_password_change
    column :email
    column :created_at
    actions
  end

  filter :email
  filter :first_name
  filter :last_name
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :allow_password_change
      f.input :password
      f.input :password_confirmation
      f.input :first_name
      f.input :last_name
    end
    f.actions
  end
end
