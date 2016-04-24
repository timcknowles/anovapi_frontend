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
    %script{:type => "text/javascript", :src => "https://code.jquery.com/jquery-2.1.0.min.js"}

  %body{style: "font-family: Arial"}
    %h2 Status:
    %textarea#message{style: "padding:10px;width:500px;height:100px"}

    %div
      =yield



@@root
:javascript
  $(document).ready(function() {
    $("#start").click(function() {

      $.ajax({
        type: 'post',
        url: 'http://6bae7d7c.ngrok.io/start',
        dataType: 'json',
        complete: function(data) {
           $("#message").val(data.responseText);
        }
          });
    });

    $("#stop").click(function() {

      $.ajax({
        type: 'post',
        url: 'http://6bae7d7c.ngrok.io/stop',
        dataType: 'json',
        complete: function(data) {
           $("#message").val(data.responseText);
        }
      });
    });

    $("#settemp").click(function() {

      $.ajax({
        type: 'post',
        contentType: 'application/json',
        url: 'http://6bae7d7c.ngrok.io/temp',
        data: JSON.stringify ({"temp":$('#temp').val()}),
        dataType: 'json',
        complete: function(data) {
           $("#message").val(data.responseText);
        }
      });
    });
  });

%h2 Controls:
%button#start Start
%button#stop Stop
%input#temp{type: "number", min: "0", max: "150", value: 30}
%button#settemp Temp

@@start
It has started

@@stop
It stopped
