# dotfiles

Now organized with GNU Stow.

## Usage

Avoid stowing files using `stow` directly, and use `stower.sh` in the repo instead as it will expand templates.

Run `update_gitignore.sh` to update the `.gitignore` file for templated files.

Run `ingest.sh` to ingest files into the repo under the specified directory.

## Templating

Files are templated with `envsubst`. Variables are located in `vars_files/`.
