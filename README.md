# gdb-docker

A Dockerfile with GDB &amp; GEF installed and configured.

## about

This is a really simple docker container. It installs GDB, [gef](https://gef.readthedocs.io/en/master/) and all of the dependencies you may need.

## usage

Expose a mount into the container that is the folder with the data/binary you want to debug. Running it would be as follows:

```bash
docker run --rm -it -v $(pwd):/data ghcr.io/leonjza/gdb-docker:latest bash
```

Then, just run `gdb` like you'd normally do.

An example run would be:

```text
❯ docker run --rm -it -v $(pwd):/data ghcr.io/leonjza/gdb-docker:latest bash
root@4e8a1086c414:/#
root@4e8a1086c414:/# gdb -q /data/main
GEF for linux ready, type `gef' to start, `gef config' to configure
96 commands loaded for GDB 10.1.90.20210103-git using Python engine 3.9
Reading symbols from /data/main...
warning: Missing auto-load script at offset 0 in section .debug_gdb_scripts
of file /data/main.
Use `info auto-load python-scripts [REGEXP]' to list them.
gef➤
```

