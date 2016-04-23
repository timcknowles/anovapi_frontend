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

			$.ajax({
			  type: 'post',
			  url: 'http://192.168.0.13:5000/start',
			  dataType: 'json',
			  success: function(data) {
			     $("#message").html(data);
			  }
	        });
		});

		$("#stop").click(function() { 

			$.ajax({
			  type: 'post',
			  url: 'http://192.168.0.13:5000/stop',
			  dataType: 'json',
			  success: function(data) {
			     $("#message").html(data);
			  }
	        });
		});
		
		$("#settemp").click(function() { 

			$.ajax({
			  type: 'post',
			  contentType: 'application/json',
			  url: 'http://192.168.0.13:5000/temp',
			  data: JSON. stringify ({"temp":"50"}),
			  dataType: 'json',
			  success: function(data) {
			     $("#message").html(data);
			  }
	        });
		});
	});
%button#start Start 
%button#stop Stop
%button#settemp Temp

@@start
It has started

@@stop
It stopped