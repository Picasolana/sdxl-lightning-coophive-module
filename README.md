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
    picassolano:v0.1
```

Will overwrite `outputs/output.png` each time.

### Coophive Module

```
hive run picassolano:v0.1 -i Prompt="an amazing morning view with mountain near the lake" -i Seed=16
```
