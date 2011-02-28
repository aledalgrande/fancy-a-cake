require 'sinatra'
require 'haml'
require 'pony'

get '/' do
  @notice = params['notice']
  haml :index
end

post '/request_cake' do
  Pony.mail(
            :from => params['email'],
            :to => ENV['EMAIL'],
            :subject => "Cake request #{Time.now}",
            :body => params['why'],
            :via => :smtp,
            :via_options => {
                              :address => 'smtp.sendgrid.net',
                              :port => '25',
                              :user_name => ENV['SENDGRID_USERNAME'],
                              :password => ENV['SENDGRID_PASSWORD'],
                              :authentication => :plain,
                              :domain => ENV['SENDGRID_DOMAIN']
                            }
            )
  redirect '/?notice=sent'
end