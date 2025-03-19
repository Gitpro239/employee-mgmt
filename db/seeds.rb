# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# employee = Employee.new(first_name: 'Ravi', last_name: 'Singh', email: 'ravi@ror.com',
# role: 'Ruby on Rails Developer', department: 'Ruby on Rails Developement', phone: '1234567890',
#  salary: '60000', bonus: '6000', hire_date: Date.today)AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

# <div class="pb-4 bg-white dark:bg-gray-800 mb-8">
# <div class="grid grid-cols-3">
#   <div>
#     <%= form_tag(patients_path, method: :get, class: "max-w-md") do %>
#       <label for="search_query" class="mb-2 text-sm font-medium text-gray-900 sr-only dark:text-white">Search</label>
#       <div class="relative">
#         <div class="absolute inset-y-0 start-0 flex items-center ps-3 pointer-events-none">

#         </div>
#         <%= text_field_tag 'search_query', params[:search_query], class: 'block w-full p-4 ps-10 text-sm text-gray-900 border border-gray-300 rounded-lg bg-gray-50 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white', placeholder: 'Search Patients by name', required: true %>
#         <button type="submit" class="text-white absolute end-2.5 bottom-2.5 bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-4 py-2 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Search</button>
#       </div>
#     <% end %>
#   </div>
#   <div>
#     <% if params[:search_query].present? %>
#     <%= link_to patients_path do %>
#       <button type="button" class="py-2.5 px-5 me-2 mb-2 text-sm font-medium text-gray-900 focus:outline-none bg-white rounded-full border border-gray-200 hover:bg-gray-100 hover:text-blue-700 focus:z-10 focus:ring-4 focus:ring-gray-100 dark:focus:ring-gray-700 dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600 dark:hover:text-white dark:hover:bg-gray-700">Clear Search</button>
#       <% end %>
#     <% end %>
#   </div>
# </div>
# </div>
