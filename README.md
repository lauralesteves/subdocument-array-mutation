# Subdocument Array mutation

## Description

Subdocument Array Mutation is a serverless API that receives a document and a set of mutation instructions, then recursively resolves all nested changes — adds, updates, and removals — across deeply nested subdocument arrays. It outputs the precise, path-indexed operations ready to be applied to a database, removing the complexity of manually tracking array positions and nested paths from client applications.

## Structure

```
.
├── modules (modules folder)
│   └── mutation (module / context)
│       └── endpoints (API endpoints)
│           └── mutate.js
├── package.json
├── serverless.yml (serverless config)
├── handlers (functions config)
│   └── mutation-endpoints.yml (endpoints config)
├── shared (shared components)
│   ├── mutation.js **(algorithm to mutate)**
│   └── api.js (API Gateway response helper)
└── test (tests folder)
```

## Development environment

This project uses `serverless-offline` plugin and some containers and plugins to emulate the AWS Resources.

```bash
make dev
```
The applications will start on `http://localhost:3000`

#### Running with Docker

```bash
make docker
```

### Dev Plugins

* [serverless-offline](https://github.com/dherault/serverless-offline/issues) - For run API Gateway local and manage plugins
* [serverless-plugin-split-stacks](https://github.com/dougmoscrop/serverless-plugin-split-stacks) - Split Cloudformation Templates

## Production environment

### Deploy full services

```bash
make deploy
```

### Deploy a function

```bash
make deploy-function FUNCTION=mutate
```

### Get function logs

```bash
make logs FUNCTION=mutate
```

### Clean All

```bash
make remove
```

## Testing

### All Tests

```bash
make test
```

### Unit Tests

```bash
make unit-test
```

### Integration Tests

```bash
make integration-test
```

## TODOs

- [ ] Add Coverage Testing
- [x] Add automated deploy with GitHub Actions
- [ ] Add Mongo and test the mutations
- [ ] Set a background lambda and split the request for change in DB and the actual execution (adding an endpoint to see if transaction was completed)