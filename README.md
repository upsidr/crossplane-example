# crossplane-example

This repository is to showcase how Crossplane could be used to create resources in multi-cloud environment.

Although this has been curated so that it would be a good starting point for Crossplane configuration, please note that this is only an example setup, and is not meant to be a production ready setup.

## Steps

### 0. Prerequisites

- Get GitHub Access Token (if using GitHub)
- Clone this repository
- Create KinD clusters
- Install required tools (if using Nix with direnv, simply `direnv allow`)

### 1. Install Flux to Cluster

``` sh
$ flux bootstrap github --owner upsidr --repository crossplane-example --path flux/ENV --context KUBE_CONTEXT
```

### 2. Wait for Crossplane to Start up

### 3. Configure Access Tokens

For Civo, this is:

``` sh
export CIVO_API_KEY_B64="$(echo -n "$CIVO_API_KEY" | base64)"
envsubst < crossplane/civo/providers/civo-creds.yaml.tmpl | k apply --context kind-crossplane-for-civo -f -
```

### 4. Create Resources using XR
