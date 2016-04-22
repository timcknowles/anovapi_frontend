require 'sinatra'
require 'haml'

get "/" do
	haml :root 
end  

get "/start" do
	haml :start
end  

get "/stop" do 
	haml :stop
end

__END__

@@layout 

!!!
%html
  %head
    %title AJAX example
    %script{:type => "text/javascript", :src => "http://code.jquery.com/jquery-2.1.0.min.js"}
  %body
  #message
  =yield
    


@@root
:javascript 
	$(document).ready(function() { 
		$("#start").click(function() { 
			$.post( {url:"http://8567a3b9.ngrok.io/start", success:function(result) { 
			$("#message").html(result);
			}});
		});

		$("#stop").click(function() { 
			$.ajax( {url:"/stop", success:function(result) { 
			$("#message").html(result); 
			}}); 
		}); 
	});
%button#start Start 
%button#stop Stop

@@start
It has started

@@stop
It stopped