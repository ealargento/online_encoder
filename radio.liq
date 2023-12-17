def settings(~protocol,~data,~headers,uri) =
   http.response(

     data="hola"

   )
end


harbor.http.register(port=8080,method="POST", "toma", settings)

harbor.http.static(port=8080, path="/music", browse=true, "este") #Finally! with these arguments we can access here: http://localhost:8080/music/encoder.htm) and you will get: /media/ender/DATOS/Ender/henry/online_encoder/este/encoder.htm)

output.icecast(%mp3, host="link.zeno.fm", port=80, password="R5gFrWkG", mount="lwyvqqrr387uv", fallible=true, input.harbor("mount",port=8080))

log(label="MY MESSAGE","hola papu")
