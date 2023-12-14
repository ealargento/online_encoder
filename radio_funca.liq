def redirect_icecast(~protocol,~data,~headers,uri) =
   http.response(

     data="hola"


   )
end

# Register this handler at port 8005
# (provided harbor sources are also served
#  from this port).
harbor.http.register(port=8080,method="GET",
                     "^/(?!admin)",

                     redirect_icecast)

#interactive.harbor();
output.ao(fallible=true,audio_to_stereo(input.harbor("mount",port=8080)))
