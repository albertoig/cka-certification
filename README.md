# TABLE OF CONTENT
- [PROJECT SETUP](#project-setup)
   * [GIT CONFIGURATIONS](#git-configurations)
   * [TERRAFORM CONFIGURATIONS](#terraform-configurations)
- [CKA CONTENT](#cka-content)
- [STUDY PROGRESS](#study-progress)

# PROJECT SETUP
## TOOLS
The following list outlines the tools required for this project, which you should have installed to utilize this repository to its fullest extent:
- [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
- [PyEnv](https://github.com/pyenv/pyenv)
- [Poetry](https://python-poetry.org/docs/#installing-with-the-official-installer)
- [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

## GIT CONFIGURATIONS
GPG signing is mandatory, you must sign your commits, [vigilant](https://docs.github.com/en/authentication/managing-commit-signature-verification/displaying-verification-statuses-for-all-of-your-commits) mode is activated in this repository. 

This is how to do it: 
- Generate a new [GPG key](https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key).
- Add GPG key to your [Github account](https://docs.github.com/en/authentication/managing-commit-signature-verification/adding-a-gpg-key-to-your-github-account).
    - This is how you copy [the GPG public key](https://gist.github.com/lysender/2dbab9ee6913fb3b6d54f0764a5554c2).
- Add the GPG key to your [GIT configuration](https://docs.github.com/en/authentication/managing-commit-signature-verification/telling-git-about-your-signing-key).
- Remenber to add `git config --global commit.gpgsign true` to your configuration to ensure that commits are signed.
- If you have multiple .gitconfigs, remenber to use user.signingkey parameter. 

## TERRAFORM CONFIGURATIONS
The repository use terraform to prepare the basic infrastructure to study for the CKA exam. You will need:
- AWS credentials in your session to fetch the state file. ([Here is how to](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)) 
- Digital Ocean credentials in your session to deploy infrastructure. ([Here is how to](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs))

> [!IMPORTANT]  
> Install [digital ocean CLI](https://docs.digitalocean.com/reference/doctl/how-to/install/) to set up kubernetes config faster

## RECOMENDATIONS
- Activate `poetry config virtualenvs.in-project true` in the project
- [Multi workspace](https://code.visualstudio.com/docs/editor/multi-root-workspaces) configurations [with python](https://github.com/microsoft/vscode-python/wiki/Mono-Repo-Set%E2%80%90up-Guide).
    - How to [Change interpreter](https://stackoverflow.com/questions/48135624/how-can-i-change-the-python-version-in-visual-studio-code)
# CKA CONTENT
1. [CORE](certification/1-core/README.md)
2. WORKLOADS
    1. [LABELS & SELECTORS](=certification/2-workloads/1-labels&selectors/README.md)
    2. [REPLICASET](certification/2-workloads/2-replicaset/README.md)
    3. [DEPLOYMENT](certification/2-workloads/3-deployments/README.md)
    4. [DAEMONSET](certification/2-workloads/4-daemonsets/README.md)
    5. [ASSIGNING PODS TO NODES](certification/2-workloads/5-assign-pods-nodes/README.md)


# STUDY PROGRESS
- [ ] Label&Selectors
- [ ] ReplicaSets
- [X] Deployments
    - [X] YAML
    - [X] CLI
    - [X] IMPORTANT FOR EXAM
- [X] DaemonSets
- [X] Assign Pods to Nodes
    - [X] Node Selector
    - [X] Node Affinity
    - [X] Resource request and limits
    - [X] Schedling Pods without Scheduler
    - [X] Taints and Tolerations
