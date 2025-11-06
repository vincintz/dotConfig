# My personal dotConfig files

## Bootstrap/install

### Prerequisite
1. System is updated
    ```
    sudo apt update && sudo apt upgrade -y
    ```
2. Git is updated with the correct credentials
    ```
    sudo apt install git
    ssh-keygen -t ed25519 -C "vincintz@yahoo.com"
    git config --global user.name "Theo Reyes"
    git config --global user.email "vincintz@yahoo.com"
    ```

### Bootstrap the config
1. Clone repo
    ```
    mkdir -p [path/to/repos/]
    cd [path/to/repos/]
    git -C $HOME clone git@github.com:vincintz/dotConfig.git
    ```
2. Run bootstrap command
    ```
    [path/to/repos/]dotConfig/bootstrap/ubuntu.sh
    ```

## Note
* Tested on Ubuntu 25.10
