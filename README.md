# Publish to NPM

For CircleCI or the shell

If you need an _authentication token_ to publish then you should resolve that before executing this script

```bash
echo ".publish/publish.sh" >> .npmignore
git clone https://github.com/sequencemedia/publish.git .publish
.publish/publish.sh
```

A Gist with the same content as `publish.sh` may need an additional step

```bash
echo ".publish/publish.sh" >> .npmignore
git clone https://gist.github.com/3d97362bd1c87996c92f4e599aff64bd.git .publish
chmod +x .publish/publish.sh
.publish/publish.sh
```
