# Packer build with Parallels Desktop and Vagrant

I created this project to help me build a master Operating System image for my lab, running on Parallels Desktop and provisionable with Vagrant.
The build runs entirely on Parallels and a the end creates a BOX file deployable with Vagrant

At the moment the config is ready to build a Debian Bookworm image with arm64 architecture, beacause my base lab is a Mac Mini M2 Pro

## Requirements

Before you can build you need to install packer; in my case I used the official docs that use Homebrew [link](https://developer.hashicorp.com/packer/downloads?product_intent=packer)

You also need Parallels Desktop Pro installed and already configured [link](https://www.parallels.com/products/desktop/pro/). At the moment I'm not sure that is possible to use Parallels Desktop Standard for using the Packer provider

Next you need to install some plugins, that are included on 'require.pkr.hcl' file.
After cloning the project, this is done changing dir to linux/debian and running the command

```shell
packer init .
```

this will install all plugins included in the file

You also need to create a new HCL file containing all the 'sensitive' variables needed, you can duplicate the file sensitive.pkr.hcl.tmpl to .sensitive.pkr.hcl (if you use this name this is alredy on .gitignore).

Before launch the build I suggest you to check all the files, and tune the config according to your needs, for example you need to modify the variable for the Vagrant box output dir "box_output_dir", in debian.auto.pkr.hcl because it point to my home folder on Macos.
Also maybe you need to modify the timezone, keyboard, language etc., the names of the variables are in most cases descriptive

### Building

From the directory of HCL files launch the validate to verify the build and the files:

```shell
packer validate .
```

If the validate is successfull you can launch the build with:

```shell
packer build .
```

The build starts and you can find the box created in the folder you specified as 'box_output_dir' if end correctly.

After modifications to the files I reccomend to launch the command to format and lint the output files

```shell
packer fmt .
```

## Customization

This project is fresh and customized to my necessities so I reccomend you to check all the passages I implemented before launch.
For example I use a customized preseed file, cloud-init installation and configuration, Parallels Tools installation.
Also it's structured to permmit multiple dynamic build, with disk variants and os variants.

## Issues, bugs, requests, collaboration

Feel free to open issues or requests, fork and customize the project

## Next steps

- Multi architecture builds
- Ubuntu images
- Windows images
- Gitlab Pipeline

### Tools and links

- [Hashicorp Packer](https://github.com/hashicorp/packer)
- [Packer Parallels plugin](https://github.com/Parallels/packer-plugin-parallels)
- [Packer Vagrant plugin](https://github.com/hashicorp/packer-plugin-vagrant)
- [Cloud-Init](https://cloudinit.readthedocs.io/en/latest/)
- [Debian Preseed](https://wiki.debian.org/DebianInstaller/Preseed)
