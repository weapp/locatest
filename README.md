# Localest

# TO DO

[x] Cliente para plataformas
[x] Modelo de plataformas
[x] Modelos internos
[X] Test unitarios
[x] Endpoint de consulta
[x] Endpoint de actualizacion
[x] Workers para actualizar las plataformas
[ ] Validacion de inputs
[ ] Manejo de decimals
[ ] Documentar api para front
[ ] Tests de integracion


## Assumption and Notes

* The API KEY provided is only for development. Production API KEY should be managed as a secret environment variable.


## Requirements
Hola Manuel, un posible cliente: “The Original Mexican Burrito”, nos ha mandado el siguiente correo en el que nos hace una propuesta para el desarrollo de una pequeña aplicación.

```
Hola,

Veréis, desde hace 8 años llevo el mejor sitio de burritos de la galaxia,
ubicado en un pequeño barrio de Madrid. Con el auge de las redes sociales y el
uso de teléfonos móviles, me decidí a crear una página en diversas plataformas,
las más usadas, para poder aumentar la visibilidad de mi negocio y atraer más
gente. Sin embargo, me ha traído una serie de complicaciones debido a que para
poder actualizar cualquier dato en cada una de esas redes sociales, necesito ir
una a una cambiando la información. Además, necesito estar al tanto de cómo
funciona cada una de ellas.
Quería encargaros una aplicación sencilla que me sirviera para gestionar desde
un único punto cada una de esas redes sociales, de forma cómoda y sencilla, y
así evitar tener que estar actualizando los datos uno a uno.

Muchas gracias por vuestra atención, The Original Mexican Burrito.
```

Tras realizar un pequeño análisis hemos visto que el proyecto es viable y que podría desarrollarse en aproximadamente un máximo de 6 horas de trabajo.

Los requisitos funcionales son los siguientes:

- Deberá poder mostrar la información que tengamos en la propia aplicación sobre el establecimiento.
- Deberá poder mostrar la información que tengamos de cada una de las plataformas sobre el establecimiento.
- Deberá poder actualizar la información del establecimiento y que estos cambios se reflejen (se
actualicen) en cada una de las plataformas.

Los requisitos técnicos son los siguientes:

- Deberá implementarse en Ruby (podrás usar cualquier framework en dicho lenguaje).
- Deberá emplear una base de datos relacional.
- Deberá implementarse como una API JSON. No hace falta nada de frontend.
- Deberá mantener la consistencia de datos entre plataformas (no queremos que haya datos sin actualizar en alguna de estas).
- Deberá estar protegida de errores. No tenemos control sobre las plataformas por lo que podría haber fallos fuera de nuestro control.
- Deberá estar testeada.

Es importante además que una vez finalizada la aplicación documentes los endpoints que hayas levantado para poder pasárselos al equipo de frontend y que estos puedan desarrollar el front.

Creemos que la siguiente información puede serte útil: Tu API KEY es la siguiente: "0a244d74f524b60ac8582131703e99ac". Deberás usarla para hacer todas las peticiones a las plataformas A, B y C.

Endpoints:

1. Ver información sobre el establecimiento en las plataformas A, B y C:
```
GET https://rails-code-challenge.herokuapp.com/platform_a/venue?api_key=API_KEY
GET https://rails-code-challenge.herokuapp.com/platform_b/venue?api_key=API_KEY
GET https://rails-code-challenge.herokuapp.com/platform_c/venue?api_key=API_KEY
```

2. Actualizar información sobre el establecimiento en las plataformas A, B y C:
```
PATCH https://rails-code-challenge.herokuapp.com/platform_a/venue?api_key=API_KEY
PATCH https://rails-code-challenge.herokuapp.com/platform_b/venue?api_key=API_KEY
PATCH https://rails-code-challenge.herokuapp.com/platform_c/venue?api_key=API_KEY
```

Estas son las estructuras de datos que recibirás tras realizar cada uno de los GET en cada plataforma y que podrás actualizar realizando un PATCH.


**Platform A:**

| Type      | Mandatory | Name            | Description           |
| :-------: | :-------: | :-------------: | :-------------------: |
| String    | yes       | name            | Venue name            |
| String    | yes       | address         | Venue address         |
| Decimal   | yes       | lat             | Venue latitude        |
| Decimal   | yes       | lng             | Venue longitude       |
| Integer   | yes       | category_id     | between 1000 and 1200 |
| Boolean   | yes       | closed          | true or false         |
| String    |           | hours           | opening hours.*       |

\*hours format:
```
10:00-22:00|10:00-22:00|10:00-22:00|10:00-22:00|10:00-22:00|11:00-18:00|11:00-18:00
```


**Platform B:**

| Type      | Mandatory | Name            | Description           |
| :-------: | :-------: | :-------------: | :-------------------: |
| String    | yes       | name            | Venue name            |
| String    | yes       | street_address  | Venue address         |
| Decimal   | yes       | lat             | Venue latitude        |
| Decimal   | yes       | lng             | Venue longitude       |
| Integer   | yes       | category_id     | between 2000 and 2200 |
| Boolean   | yes       | closed          | true or false         |
| String    |           | hours           | opening hours.*       |

\*hours format:
```
Mon:10:00-22:00|Tue:10:00-22:00|Wed:10:00-22:00|Thu:10:00-22:00|Fri:10:00-22:00|Sat:11:00-18:00|Sun:11:00-18:00
```


**Platform C:**

| Type      | Mandatory | Name            | Description           |
| :-------: | :-------: | :-------------: | :-------------------: |
| String    | yes       | name            | Venue name            |
| String    | yes       | address_line_1  | Venue address         |
| String    |           | address_line_2  | venue address         |
| String    |           | website         | Website URL           |
| String    |           | phone_number    | Phone number          |
| Decimal   | yes       | lat             | Venue latitude        |
| Decimal   | yes       | lng             | Venue longitude       |
| Boolean   | yes       | closed          | true or false         |
| String    |           | hours           | opening hours.*       |

\*hours format:
```
10:00-22:00,10:00-22:00,10:00-22:00,10:00-22:00,10:00-22:00,11:00-18:00,11:00-18:00
```


# Debug info

```sh
curl -i https://rails-code-challenge.herokuapp.com/platform_a/venue?api_key=0a244d74f524b60ac8582131703e99ac
HTTP/1.1 200 OK
Server: Cowboy
Date: Wed, 06 Mar 2019 11:59:18 GMT
Connection: keep-alive
Content-Type: application/json; charset=utf-8
Etag: W/"0aabcd84291ab994acd93b01a9dab37a"
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: e4d37731-26dc-4a17-babc-d56026df2c33
X-Runtime: 0.200014
Transfer-Encoding: chunked
Via: 1.1 vegur

{"id":5,"name":"Cummings-Lehner","address":"93432 Dario Station","lat":"59.1485919774","lng":"9.6239895111","category_id":1004,"closed":true,"hours":"10:00-22:00|10:00-22:00|10:00-22:00|10:00-22:00|10:00-22:00|11:00-18:00|11:00-18:00","created_at":"2019-03-04T17:09:00.605Z","updated_at":"2019-03-04T17:09:00.605Z","api_key":"0a244d74f524b60ac8582131703e99ac"}

# indented with jq:
{
  "id": 5,
  "name": "Cummings-Lehner",
  "address": "93432 Dario Station",
  "lat": "59.1485919774",
  "lng": "9.6239895111",
  "category_id": 1004,
  "closed": true,
  "hours": "10:00-22:00|10:00-22:00|10:00-22:00|10:00-22:00|10:00-22:00|11:00-18:00|11:00-18:00",
  "created_at": "2019-03-04T17:09:00.605Z",
  "updated_at": "2019-03-04T17:09:00.605Z",
  "api_key": "0a244d74f524b60ac8582131703e99ac"
}


curl -i https://rails-code-challenge.herokuapp.com/platform_b/venue?api_key=0a244d74f524b60ac8582131703e99ac
ey=0a244d74f524b60ac8582131703e99ac
HTTP/1.1 200 OK
Server: Cowboy
Date: Wed, 06 Mar 2019 11:59:35 GMT
Connection: keep-alive
Content-Type: application/json; charset=utf-8
Etag: W/"1940149f510ef9a3ceff9641886178ef"
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 39abbdd3-8908-4636-8e25-828a91ba5abb
X-Runtime: 0.034812
Transfer-Encoding: chunked
Via: 1.1 vegur

{"id":5,"name":"Cummings-Lehner","street_address":"93432 Dario Station","lat":"59.1485919774","lng":"9.6239895111","category_id":2004,"closed":false,"hours":"Mon:10:00-22:00|Tue:10:00-22:00|Wed:10:00-22:00|Thu:10:00-22:00|Fri:10:00-22:00|Sat:11:00-18:00|Sun:11:00-18:00","created_at":"2019-03-04T17:09:00.640Z","updated_at":"2019-03-04T17:09:00.640Z","api_key":"0a244d74f524b60ac8582131703e99ac"}

# indented with jq:
{
  "id": 5,
  "name": "Cummings-Lehner",
  "street_address": "93432 Dario Station",
  "lat": "59.1485919774",
  "lng": "9.6239895111",
  "category_id": 2004,
  "closed": false,
  "hours": "Mon:10:00-22:00|Tue:10:00-22:00|Wed:10:00-22:00|Thu:10:00-22:00|Fri:10:00-22:00|Sat:11:00-18:00|Sun:11:00-18:00",
  "created_at": "2019-03-04T17:09:00.640Z",
  "updated_at": "2019-03-04T17:09:00.640Z",
  "api_key": "0a244d74f524b60ac8582131703e99ac"
}


curl -i https://rails-code-challenge.herokuapp.com/platform_c/venue?api_key=0a244d74f524b60ac8582131703e99ac
HTTP/1.1 200 OK
Server: Cowboy
Date: Wed, 06 Mar 2019 11:59:49 GMT
Connection: keep-alive
Content-Type: application/json; charset=utf-8
Etag: W/"8ee3e39a47ec1b0a1601d611485d99d0"
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: f3766108-fece-4422-941a-51ae065c4e61
X-Runtime: 0.027118
Transfer-Encoding: chunked
Via: 1.1 vegur

{"id":5,"name":"Cummings-Lehner","address_line_1":"93432 Dario Station","address_line_2":"Apt. 809","website":"https://localistico.com","phone_number":"+34666999666","lat":"59.1485919774","lng":"9.6239895111","closed":false,"hours":"10:00-22:00,10:00-22:00,10:00-22:00,10:00-22:00,10:00-22:00,11:00-18:00,11:00-18:00","created_at":"2019-03-04T17:09:00.657Z","updated_at":"2019-03-04T17:09:00.657Z","api_key":"0a244d74f524b60ac8582131703e99ac"}

# indented with jq:
{
  "id": 5,
  "name": "Cummings-Lehner",
  "address_line_1": "93432 Dario Station",
  "address_line_2": "Apt. 809",
  "website": "https://localistico.com",
  "phone_number": "+34666999666",
  "lat": "59.1485919774",
  "lng": "9.6239895111",
  "closed": false,
  "hours": "10:00-22:00,10:00-22:00,10:00-22:00,10:00-22:00,10:00-22:00,11:00-18:00,11:00-18:00",
  "created_at": "2019-03-04T17:09:00.657Z",
  "updated_at": "2019-03-04T17:09:00.657Z",
  "api_key": "0a244d74f524b60ac8582131703e99ac"
}
```
