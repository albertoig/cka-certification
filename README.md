
# PROJECT SETUP
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
