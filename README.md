# Sinatra app

Example Sinatra app with Prometheus instrumentation. Prometheus scraping endpoint is protected by basic authentication.

Run with:

```sh
$ bundle exec rackup
```

The app will run at `http://localhost:9292`.

You can check the output of the default `/` route with `curl`:

```sh
$ curl http://localhost:9292/
Everybody can see this page without auth
```

Example protected endpoint requiring basic auth:

```sh
$ curl http://localhost:9292/protected
Not authorized
```

```sh
$ curl -u admin:admin http://localhost:9292/protected
Welcome, authenticated client
```

Prometheus metrics scraping endpoint also requires basic auth:

```sh
$ curl http://localhost:9292/metrics
Not authorized
```

```sh
$ curl -u admin:admin http://localhost:9292/metrics
# TYPE http_server_requests_total counter
# HELP http_server_requests_total The total number of HTTP requests handled by the Rack application.
http_server_requests_total{code="200",method="get",path="/"} 2.0
http_server_requests_total{code="401",method="get",path="/protected"} 1.0
http_server_requests_total{code="200",method="get",path="/protected"} 1.0
http_server_requests_total{code="404",method="get",path="/favicon.ico"} 1.0
http_server_requests_total{code="401",method="get",path="/metrics"} 2.0
http_server_requests_total{code="200",method="get",path="/metrics"} 1.0
...
```
