Simple example of how to use nginx and PHP FPM on the same container

# Instructions

1. Create docker image

```
$ docker build .
```

2. Run container

```
docker run -p 80:80 <image_id>
```

3. Call endpoint

```
curl http://localhost/index.php
```

It should show the php info page
