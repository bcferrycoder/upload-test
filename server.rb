require 'rubygems'
require 'sinatra'
require 'haml'
 
set :bind, '0.0.0.0'
#set :bind, '172.17.0.24'
set :port, 4567

# Handle GET-request (Show the upload form)
get "/upload" do
  haml :upload
end      
    
# Handle POST-request (Receive and save the uploaded file)
post "/upload" do 
  File.open('uploads/' + params['myfile'][:filename], "w") do |f|
    f.write(params['myfile'][:tempfile].read)
  end
  return "The file was successfully uploaded!"
end
