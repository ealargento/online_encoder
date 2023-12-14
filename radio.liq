def redirect_icecast(~protocol,~data,~headers,uri) =
   http.response(

     data="hola"

   )
end

# Register this handler at port 8005
# (provided harbor sources are also served
#  from this port).
harbor.http.register(port=8080,method="GET", "toma", redirect_icecast)

harbor.http.static(port=8080, path="/music", browse=true, "este") #Finally! with these arguments we can access here: http://localhost:8080/music/encoder.htm) and you will get: /media/ender/DATOS/Ender/henry/online_encoder/este/encoder.htm)


#output.ao(fallible=true,audio_to_stereo(input.harbor("mount",port=8080)))

output.icecast(%mp3, host="link.zeno.fm", port=80, password="R5gFrWkG", mount="lwyvqqrr387uv", fallible=true, input.harbor("mount",port=8080))
