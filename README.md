# tnfsd
Simple Docker container to run the TNFSD server daemon for Spectranet

# Example usage

```
docker run --rm -d \
  -v $PWD:/data \
  -p 16384:16384/udp \
  markdr/tnfsd \
```

# Other information

See my [blog](https://markround.com/blog) and [spectrum projects](https://markround.com/spectrum) for more information on my development environment and things I've built.
