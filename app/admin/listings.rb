ActiveAdmin.register Listing do
  includes :user
  permit_params :user_id
end
