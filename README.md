# AlignWise-docker

[Dockerfile](https://github.com/joelnitta/AlignWise-docker/blob/master/Dockerfile) and [image](https://hub.docker.com/r/joelnitta/alignwise/) for running [AlignWise](https://github.com/TeriForey/AlignWise).


## Example Usage

Pull the most recent build:

```
docker pull joelnitta/alignwise
```

Launch the container:

```
docker run --rm -it joelnitta/alignwise
```

Or, run `AlignWise` commands directly from docker by mounting a volume containing the query and BLAST database files (here, `/working/dir`):

```
docker run --rm -v /working/dir:/home joelnitta/alignwise -n my_nucl_db -p my_prot_db my_seq.fasta
```
