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
    %script{:type => "text/javascript", :src => ".js/jquery.ajax-cross-origin.min.js"}
  %body
  #message
  =yield
    


@@root
:javascript 
	$(document).ready(function() { 
		$("#start").click(function() { 

			$.ajax({
			  crossOrigin: true,
			  type: 'post',
			  url: 'http://8567a3b9.ngrok.io/start',
			  dataType: 'jsonp',
			  success: function(data) {
			     $("#message").html(data);
			  }
	        });
		});

		$("#stop").click(function() { 

			$.ajax({
			  crossOrigin: true,
			  type: 'get',
			  url: 'http://8567a3b9.ngrok.io/stop',
			  dataType: 'jsonp',
			  success: function(data) {
			     $("#message").html(data);
			  }
	        });
		});
		
		$("#settemp").click(function() { 

			$.ajax({
			  crossOrigin: true,
			  type: 'post',
			  url: 'http://8567a3b9.ngrok.io/temp',
			  dataType: 'jsonp',
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