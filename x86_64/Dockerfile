# name the portage image
FROM gentoo/portage:latest as portage

# image is based on stage3-amd64
FROM gentoo/stage3-amd64:latest

# copy the entire portage volume in
COPY --from=portage /var/db/repos/gentoo /var/db/repos/gentoo

# continue with image build ...
RUN emerge -qv sys-kernel/gentoo-kernel-bin # or whichever packages you need


