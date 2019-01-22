# Dotfiles

Unix/linux friendly scripts and shell goodness.

1. Clone the repo and install stuff
    
    ```bash
    git clone git@github.com:FelikZ/dotfiles.git ~/dotfiles
    . ~/dotfiles/setup.sh
    ```
1. Install fonts:
    
    ```bash
    ls -l ~/dotfiles/fonts
    ```

**NOTE:** to compile fonts, use:

```bash
git clone git@github.com:FelikZ/Ligaturizer.git
cd Ligaturizer
git checkout fonts
make
ls -l ./fonts/output
```
