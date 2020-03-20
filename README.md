# Run a Firebase CLI command

Run a command, like `firebase deploy --only hosting`.

## Configuring Firebase

Firebase automatically uses the `FIREBASE_TOKEN` and `FIREBASE_PROJECT` environment variables when provided. 

To retrieve the `FIREBASE_TOKEN`, run `firebase login:ci` on your desktop to retrieve your Firebase auth token. Save this as a [repository secret](https://help.github.com/en/articles/virtual-environments-for-github-actions#creating-and-using-secrets-encrypted-variables) in your repository.

The `FIREBASE_PROJECT` is the project ID, which can usually be found in the `.firebaserc` file (`default` attribute). This can be configured in the action instead of a secret.

## Example workflow

```
name: Build and Deploy
on:
  push:
    branches:
    - master
jobs:
  main:
    name: Build and Deploy
    runs-on: ubuntu-latest
    steps:
    - name: Check out code
      uses: actions/checkout@master
    - name: Firebase Command
      uses: butlerlogic/action-firebase-cli@stable
      env:
        FIREBASE_TOKEN: ${{ secrets.FIREBASE_TOKEN }}
        FIREBASE_PROJECT: name-of-the-project
        COMMAND: deploy --only hosting
```