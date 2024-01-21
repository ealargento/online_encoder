#Let s define references for the script to use:

mount=ref("mount")
host=ref("pepito")
port=ref(8000)
password=ref("password")



def settings(~protocol,~data,~headers,uri) =


  print("estos son mis parámetros para conectarme con servidor externo de Icecast: data -->#{data}")

#we get the json string data and turn it into a liquidsoap record
#why json.parse was not working? I was doing the explicit type annotation wrong! First, port was not type int, it was type string. Second, instead of using server i was using host which is erroneous because the word used at client side (browser) is server...
#but one thing that could ve made it easier was to have an exception raised which didnt happen, i only had the program, more specificly the function, not working

  let json.parse (y:{server: string, port: int, mount: string, password: string}) = data
  print("y is -->#{y}")

#Remember: := assigns and !returns

  mount:=y.mount
  host:=y.server
  port:=y.port
  password:=y.password

  print("Let s check the values received outside of handler: mount: #{!mount}, host: #{!host}, port: #{!port}, password: #{!password}")

  http.response(data="my response")

end

harbor.http.register(port=8080,method="POST", "toma", settings)

harbor.http.static(port=8080, path="/music", browse=true, "este") #Finally! with these arguments we can access here: http://localhost:8080/music/encoder.htm) and you will get: /media/ender/DATOS/Ender/henry/online_encoder/este/encoder.htm)

#Parameters to connect to zeno server
#output.icecast(%mp3, host="link.zeno.fm", port=80, password="R5gFrWkG", mount="lwyvqqrr387uv", fallible=true, input.harbor("mount",port=8080))
output.icecast(%mp3, host=!host, port=!port, password=!password, mount=!mount, fallible=true, input.harbor("mount",port=8080))

log(label="MY MESSAGE","papu")
