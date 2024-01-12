#Let s define references for the script to use:

gmount=ref("mount")
host=ref("host")
port=ref("port")
password=ref("password")



def settings(~protocol,~data,~headers,uri) =

  #Create Association list with values in data
  m=url.split_args(data)

  #Let s assign values to each corresponding variable (or referece as they are called in liquidsoap)
  gmount:=m["mount"]
  host:=m["host"]
  port:=m["port"]
  password:=m["password"]



  print("estos son mis parámetros para conectarme con servidor externo de Icecast:
  data -->#{data}
  mount -->#{!gmount}
  host -->#{!host}
  port -->#{!port}
  pass -->#{!password}")

  http.response(data="my response")

end

harbor.http.register(port=8080,method="POST", "toma", settings)

harbor.http.static(port=8080, path="/music", browse=true, "este") #Finally! with these arguments we can access here: http://localhost:8080/music/encoder.htm) and you will get: /media/ender/DATOS/Ender/henry/online_encoder/este/encoder.htm)

#mount="lwyvqqrr387uv"
output.icecast(%mp3, host="link.zeno.fm", port=80, password="R5gFrWkG", mount=!gmount, fallible=true, input.harbor("mount",port=8080))

log(label="MY MESSAGE","papu")
