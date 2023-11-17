### Install GitLab Runner

```
curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh | sudo bash
sudo apt-get install gitlab-runner
sudo gitlab-runner start
```

### Register gitlab-runner

You can using this command if register multiple runner for different project
```
sudo gitlab-runner register
```
You will be returned a prompt like this:

```
Please enter the gitlab-ci coordinator URL (e.g. https://gitlab.com/):
```
Type https://gitlab.com/ and press Enter. The next prompt will be:

```
Please enter the gitlab-ci token for this runner:
```
1. Visit https://gitlab.com/{username}/{project}/-/settings/ci_cd.
2. Click runners => 3 dots => and copy token
3. Click disabled shared runners

```
Please enter the executor: ssh, virtualbox, kubernetes, docker, docker-ssh, shell, docker+machine, docker-ssh+machine, custom, parallels:
```
Type "shell"

```
sudo usermod -aG docker gitlab-runner
sudo nano /etc/sudoers

> insert in bottom of file :
"gitlab-runner ALL=(ALL) NOPASSWD: ALL"
```

### Verify gitlab-runner
```
cat /etc/gitlab-runner/config.toml
```