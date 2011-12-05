// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

jQuery.ajaxSetup({
    'beforSend':function(xhr){xhr.setRequestHeader('Accept',"text/javascript")}
});


function subscribe(client_instance,channel,handler){
      client_instance.subscribe(channel,function(data){
        handler(data);
    });
}

function publish(client_instance,channel,data){
    client_instance.publish(channel,data);
}

var client= null;
$(document).ready(function(){
    client = new Faye.Client('http://localhost:9292/faye');
});
