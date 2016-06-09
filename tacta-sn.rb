require 'sinatra'

require './contacts_file'

set :port, 4567

get '/' do
  "<h1>Tacta Contact Manager</h1>"
end


#get '/contacts' do
#  @contacts = read_contacts
  #"<h3>Contacts</h3>"
#  erb :'contacts/index'
#end

get '/contacts/new' do
  erb :'contacts/new'
end

post '/contacts' do
   new_contact = { name: params[:name], phone: params[:phone], email: params[:email] }

   contacts = read_contacts
   contacts << new_contact
   write_contacts( contacts )

   i = contacts.length - 1

   redirect "/contacts/#{i}"
end

get '/contacts/:i' do
  @i = params[:i].to_i
  contacts = read_contacts
  @contact = contacts[@i]
  erb :'contacts/show'
end
