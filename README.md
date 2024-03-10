# sdxl-lightning-coophive-module
Picossolano Coophive Module

```
export HUGGINGFACE_TOKEN=<my huggingface token>
```

```
docker build -t picassolano:v0.1 --build-arg HUGGINGFACE_TOKEN=$HUGGINGFACE_TOKEN .
```

```
mkdir -p outputs
```

```
docker run -ti --gpus all \
    -v $PWD/outputs:/outputs \
    -e OUTPUT_DIR=/outputs/ \
    -e PROMPT="an astronaut riding an orange horse" \
    sdxl:v0.9
```

Will overwrite `outputs/image0.png` each time.

### Coophive Module

```
hive run sdxl:v0.3.0 -i Prompt="hiro saves the hive" -i Seed=16
```

