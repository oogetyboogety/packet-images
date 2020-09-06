# name the portage image
FROM gentoo/portage:latest as portage

# image is based on stage3-amd64
FROM gentoo/stage3-amd64:latest

# copy the entire portage volume in
COPY --from=portage /var/db/repos/gentoo /var/db/repos/gentoo

# continue with image build ...
RUN touch /etc/portage/package.use/linux && echo "sys-kernel/gentoo-kernel-bin initramfs" >> /etc/portage/package.use/linux && echo "sys-kernel/linux-firmware initramfs" >> /etc/portage/package.use/linux
RUN touch /etc/portage/package.license && echo "=sys-kernel/linux-firmware-20200817 linux-fw-redistributable no-source-code" >> /etc/portage/package.license
RUN emerge -qv sys-kernel/linux-firmware && emerge -qv sys-kernel/gentoo-kernel-bin # or whichever packages you need


