FROM tfsec/builder AS build-env
FROM alpine
# use a non-privileged user
USER nobody
# work somewhere where we can write
COPY --from=build-env /src/tfsec /usr/bin/tfsec
# set the default entrypoint -- when this container is run, use this command
ENTRYPOINT [ "tfsec" ]
# as we specified an entrypoint, this is appended as an argument (i.e., `tfsec --help`)
CMD [ "--help" ]
